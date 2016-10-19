//
//  _UIWebViewScrollView+Swizzling.m
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/11/9.
//  Copyright © 2015年 ruanmei. All rights reserved.
//
//这个分类是为了hook UIWebView中的_UIWebViewScrollView而设计
#import "_UIWebViewScrollView+Swizzling.h"

#import <JRSwizzle/JRSwizzle.h>
#import <objc/runtime.h>


static void* EnableChangeFrameKey = (void *)@"EnableChangeFrameKey";

@implementation UIScrollView(_UIWebViewScrollView_Swizzling)

-(void) setFrameSwizzling:(CGRect) frame
{
    if(self.enableChangeFrame)
    {
        //DLog(@"当前：%lf, %lf, %lf, %lf", tmpSelf.frame.origin.x, tmpSelf.frame.origin.y, tmpSelf.frame.size.width, tmpSelf.frame.size.height);
        //DLog(@"设置为：%lf, %lf, %lf, %lf", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
        [self setFrameSwizzling:frame];
    }
}

////////////////////////////////////////////////////////////
#pragma mark 添加属性
-(BOOL)enableChangeFrame
{
    NSNumber *value = objc_getAssociatedObject(self, EnableChangeFrameKey);
    if(value)
    {
        return value.boolValue;
    }
    return YES;
}

-(void)setEnableChangeFrame:(BOOL)enable
{
    objc_setAssociatedObject(self, EnableChangeFrameKey, [NSNumber numberWithBool:enable], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//使用load会被自动加载,导致全局所有ScrollView被hook
//+ (void)load {
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSError* error = nil;
//        [UIScrollView jr_swizzleMethod:@selector(setFrame:) withMethod:@selector(setFrameSwizzling:) error:&error];
//    //[self swizzle:@selector(setFrame:) with:(IMP)SetFrame_Swizzling store:(IMP*)&SetFrame_Swizzling_IMP];
//    });
//}


@end
