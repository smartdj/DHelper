//
//  UIView+Visible.m
//  QiyuExplorer
//
//  Created by DJ on 16/1/29.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import "UIView+Visible.h"

@implementation UIView (Visible)
-(BOOL) isVisible
{
    if(self.hidden == NO && self.window)
        return YES;
    return NO;
}
@end
