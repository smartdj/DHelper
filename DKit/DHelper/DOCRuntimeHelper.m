//
//  DOCRuntimeHelper.m
//  QiyuExplorer
//
//  Created by DJ on 16/1/14.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import "DOCRuntimeHelper.h"
#import <objc/runtime.h>

@implementation DOCRuntimeHelper
+(void)printClassAllMethod:(Class)needPrintClass
{
    u_int count;
    Method*    methods= class_copyMethodList(needPrintClass, &count);
    for (int i = 0; i < count ; i++)
    {
        SEL name = method_getName(methods[i]);
        NSString *strName = [NSString  stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        NSLog(@"%@",strName);
    }
}

+(void)printClassAllProperty:(Class)needPrintClass
{
    u_int               count;
    objc_property_t*    properties= class_copyPropertyList(needPrintClass, &count);
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName = property_getName(properties[i]);
        NSString *strName = [NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        NSLog(@"%@",strName);
    }
}
@end
