//
//  UIView+Extension.m
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/11/3.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "UIView+Autolayout.h"

@implementation UIView (Autolayout)



+(id)autolayoutView
{
    UIView *view = [self new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}


@end
