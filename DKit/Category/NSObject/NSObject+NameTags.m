//
//  NSObject+NameTags.m
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/11/14.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "NSObject+NameTags.h"
#import <objc/runtime.h>
@implementation NSObject(NameTags)
-(id)nameTag
{
    return objc_getAssociatedObject(self, @selector(nameTag));
}

-(void)setNameTag:(NSString*)theNameTag
{
    objc_setAssociatedObject(self, @selector(nameTag), theNameTag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString*) objectIdentifier
{
    return [NSString stringWithFormat:@"%@:0x%0x", self.class.description, (int)self];
}
@end
