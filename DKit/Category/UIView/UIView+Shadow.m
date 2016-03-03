//
//  UIView+Shadow.m
//  ITHome
//
//  Created by dj on 13-6-25.
//  Copyright (c) 2013年 dj. All rights reserved.
//

#import "UIView+Shadow.h"

@implementation UIView (Shadow)
-(void)addShadow
{
    CALayer *layer = self.layer;
    layer.hidden = NO;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 5.0f;
    layer.shadowOpacity = 0.60f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
}
-(void)removeShadow
{
    CALayer *layer = self.layer;
    layer.hidden = YES;
    layer.shadowOffset = CGSizeMake(-1, -1);
    layer.shadowColor = nil;
    layer.shadowRadius = 0.0f;
    layer.shadowOpacity = 0.00f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
    
}
@end
