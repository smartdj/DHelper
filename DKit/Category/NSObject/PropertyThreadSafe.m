//
//  ClassThreadSafe.m
//  pangxie
//
//  Created by arthur on 17/1/10.
//  Copyright © 2017年 yuntongda. All rights reserved.
//

#import "PropertyThreadSafe.h"
#import <objc/runtime.h>
#import "JRSwizzle.h"

#import <UIKit/UIKit.h>

@implementation NSObject(PropertyThreadSafe)

static NSMutableDictionary<NSString *, id> *_sharedInstances = nil;
static NSMutableDictionary<NSString *, NSLock *> *_propertyThreadSafeLockDict = nil;
static NSLock *_propertyThreadSafeLockDictLock = nil;//用于_propertyThreadSafeLockDict读写的锁
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
//忽略警告
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_sharedInstances == nil) {
            _sharedInstances = [NSMutableDictionary dictionary];
        }
        
        if(_propertyThreadSafeLockDict == nil){
            _propertyThreadSafeLockDict = [NSMutableDictionary dictionary];
        }
        
        if(_propertyThreadSafeLockDictLock == nil){
            _propertyThreadSafeLockDictLock = [[NSLock alloc] init];
        }
    });
}
//#pragma clang diagnostic pop


#pragma mark -

- (void)startThreadSafeProtect{
    id sharedInstance = nil;
    
    //setter getter的替换是针对class级别的，因此要避免重复被调用
    @synchronized(self) {
        NSString *instanceClass = NSStringFromClass([self class]);
        
        // Looking for existing instance
        sharedInstance = [_sharedInstances objectForKey:instanceClass];
        
        // If there's no instance – create one and add it to the dictionary
        if (sharedInstance == nil) {
            [self changeSetterGetter];
        }
    }
}

- (void)changeSetterGetter{
    //NSArray<NSString *> *methodList = [self methodList];
    NSArray<NSString *> *propertyNameList = [self propertyNameList];
    NSError *error = nil;
    
    if(propertyNameList){
        for(NSInteger i=0; i<propertyNameList.count; i++){
            NSString *getterName = propertyNameList[i];
            
            NSString *setterName = [NSString stringWithFormat:@"set%@%@:",
                                    [[getterName substringToIndex:1] uppercaseString],
                                    [getterName substringFromIndex:1]];

            IMP getterIMP = class_getMethodImplementation([self class], NSSelectorFromString(getterName));
            IMP setterIMP = class_getMethodImplementation([self class], NSSelectorFromString(setterName));
            
            //为setter getter生成一个lock
            NSLock *lock = [[NSLock alloc] init];
            [_propertyThreadSafeLockDictLock lock];
            _propertyThreadSafeLockDict[getterName] = lock;
            [_propertyThreadSafeLockDictLock unlock];
            
            if(getterIMP){//类中已经存在getter方法
                [[self class] jr_swizzleMethod:NSSelectorFromString(getterName)
                                    withMethod:@selector(fakeGetter)
                                         error:&error];
            }else{
                Method getterMethod = class_getClassMethod([self class], NSSelectorFromString(getterName));
                method_setImplementation(getterMethod, (IMP)_getter_);
            }
            
            if(setterIMP){//调用的类中已经存在setter方法
                [[self class] jr_swizzleMethod:NSSelectorFromString(setterName)
                                    withMethod:@selector(fakeSetter:)
                                         error:&error];
            }else{
                Method setterMethod = class_getClassMethod([self class], NSSelectorFromString(setterName));
                method_setImplementation(setterMethod, (IMP)_setter_);
            }
//            if([methodList indexOfObject:getterName] != NSNotFound){
//                if([methodName hasPrefix:@"set"]){//替换Setter方法
//                    method_setImplementation(a[i], (IMP)_setter_);
//                }else{//替换Getter方法
//                    method_setImplementation(a[i], (IMP)_getter_);
//                }
//            }
        }
    }
}

- (id)fakeGetter{
    NSString *propertyName = NSStringFromSelector(_cmd);
    
    NSLock *lock = [self lockForPropertyName:propertyName];
    
    [lock lock];
    id result = [self fakeGetter];
    [lock unlock];
    
    return result;
}

- (void)fakeSetter:(id) newValue{
    NSString *selectorName = NSStringFromSelector(_cmd);
    
    NSString *propertyName = _getVarNameForSetter_(selectorName);
    
    NSLock *lock = [self lockForPropertyName:propertyName];
    
    [lock lock];
    [self fakeSetter:newValue];
    [lock unlock];
}

- (NSLock *)lockForPropertyName:(NSString *)propertyName{
    [_propertyThreadSafeLockDictLock lock];
    
    NSLock *lock = [_propertyThreadSafeLockDict objectForKey:propertyName];
    
    [_propertyThreadSafeLockDictLock unlock];
    return lock;
}

#pragma mark 新的getter方法
static id _getter_(id self, SEL _cmd)
{
    id result = nil;
    
    //根据SEL获得getter方法名
    NSString * getterName = NSStringFromSelector(_cmd);
    
    [_propertyThreadSafeLockDict[getterName] lock];
    
    //根据getter名称获取变量值
    result = _getVarValue_(self, getterName);
    
    [_propertyThreadSafeLockDict[getterName] unlock];
    
    return result;
}

#pragma mark 新的setter方法
static void _setter_(id self, SEL _cmd, id newValue)
{
    //根据SEL获得setter方法名
    NSString * setterName = NSStringFromSelector(_cmd);
    
    NSString *varName = _getVarNameForSetter_(setterName);
    
    [_propertyThreadSafeLockDict[setterName] lock];
    
    _setVarValue_(self, varName, newValue);
    
    [_propertyThreadSafeLockDict[setterName] unlock];
}

//获取当前类中属性列表
- (NSArray<NSString *> *)propertyNameList{
    NSMutableArray<NSString *> *propertyNameList = nil;
    
    //NSError* error = nil;
    unsigned count;
    
    //获取子类的类名
    NSString *subClassName = [NSString stringWithUTF8String:object_getClassName(self)];
    //获取子类的属性列表
    objc_property_t *properties = class_copyPropertyList(NSClassFromString(subClassName), &count);
    
    if(properties){
        propertyNameList = [[NSMutableArray alloc] initWithCapacity:count];
        
        for (NSInteger i=0; i<count; i++) {
            objc_property_t property = properties[i];
            NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
            const char * propertyAttrs = property_getAttributes(property);
            //具体参考https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html#//apple_ref/doc/uid/TP40008048-CH101
            if(strstr(propertyAttrs, "T@")){//只处理“对象（派生于NSObject）”的setter getter
                NSLog(@"%@", propertyName);
                
                [propertyNameList addObject:propertyName];
            }
        }
    }
    
    free(properties);
    
    return propertyNameList;
}

//获取当前类中的方法列表
- (NSArray<NSString *> *)methodList{
    NSMutableArray *methodList = [[NSMutableArray alloc] init];
    unsigned int count = 0;
    Method * methods = class_copyMethodList([self class], &count);
    
    for (unsigned int i = 0; i < count; i ++) {
        NSString * methodName = NSStringFromSelector(method_getName(methods[i]));
        
        [methodList addObject:methodName];
    }
    
    return methodList;
}

#pragma mark 根据Setter方法名获取变量名称
static NSString * _getVarNameForSetter_(NSString *setter)
{
    if (setter.length <=0 || ![setter hasPrefix:@"set"] || ![setter hasSuffix:@":"]) {
        return nil;
    }
    
    NSRange range = NSMakeRange(3, setter.length - 4);
    NSString *key = [setter substringWithRange:range];
    
    NSString *firstLetter = [[key substringToIndex:1] lowercaseString];
    key = [key stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                       withString:firstLetter];
    return key;
}

#pragma mark 获取变量值
static id _getVarValue_(id self, NSString *varName){
    unsigned int count ;
    
    //拼接变量名
    NSString * s = @"_";
    s = [s stringByAppendingString:varName];
    
    //得到变量列表
    Ivar * members = class_copyIvarList([self class], &count);
    
    int index = -1;
    //遍历变量
    for (int i = 0 ; i < count; i++) {
        Ivar var = members[i];
        //获得变量名
        const char *memberName = ivar_getName(var);
        
        //生成string
        NSString * memberNameStr = [NSString stringWithUTF8String:memberName];
        if ([s isEqualToString:memberNameStr]) {
            index = i;
            break ;
        }
    }
    
    //变量存在则赋值
    if (index > -1) {
        Ivar member= members[index];
        return object_getIvar(self, member);
    }
    return nil;
}

#pragma mark 给变量赋值
static void _setVarValue_(id self, NSString *varName, id newValue){
    unsigned int count ;
    
    //拼接变量名
    NSString * s = @"_";
    s = [s stringByAppendingString:varName];
    
    //得到变量列表
    Ivar * members = class_copyIvarList([self class], &count);
    
    int index = -1;
    //遍历变量
    for (int i = 0 ; i < count; i++) {
        Ivar var = members[i];
        //获得变量名
        const char *memberName = ivar_getName(var);
        
        //生成string
        NSString * memberNameStr = [NSString stringWithUTF8String:memberName];
        if ([s isEqualToString:memberNameStr]) {
            index = i;
            break ;
        }
    }
    
    //变量存在则赋值
    if (index > -1) {
        Ivar member= members[index];
        object_setIvar(self, member, newValue);
    }
}


//+ (void)getSubclass
//{
//    int numClasses;
//
//    Class *classes = NULL;
//
//    numClasses = objc_getClassList(NULL,0);
//
//    if (numClasses > 0)
//    {
//        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
//        numClasses = objc_getClassList(classes, numClasses);
//
//        for (int i = 0; i < numClasses; i++)
//        {
//            if (class_getSuperclass(classes[i]) == [ClassThreadSafe class])
//            {
//                NSLog(@"%@===%@",classes[i], NSStringFromClass(classes[i]));
//            }
//        }
//
//        free(classes);
//    }
//}
@end
