//
//  UIView+GestureRecognizer.m
//  QiyuExplorer
//
//  Created by DJ on 16/1/22.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import "UIView+GestureRecognizer.h"

@implementation UIView (GestureRecognizer)
-(void)addSingleTapGestureRecognizerWithTarget:(id)target withAction:(SEL)selector
{
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    [self addGestureRecognizer:singleRecognizer];
}

-(void)addLongPressGestureRecognizerWithTarget:(id)target withAction:(SEL)selector
{
    UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:target action:selector];
    [self addGestureRecognizer:longPressRecognizer];
}
@end
