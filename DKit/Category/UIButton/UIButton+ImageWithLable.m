//
//  UIButton+ImageWithLable.m
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/10/16.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "UIButton+ImageWithLable.h"

#define HELVETICANEUEMEDIUM_FONT(FONT_SIZE) [UIFont fontWithName:@"Helvetica" size:FONT_SIZE]
#define COLOR_ffffff [UIColor blackColor]
@implementation UIButton(ImageWithLable)

- (void) setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType
{
    [self setTitle:title forState:stateType];
    [self setImage:image forState:stateType];
    
}

//备注：如果不需要上下显示，只需要横向排列的时候，就不需要设置左右偏移量了，代码如下
//- (void) setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType {
//    //UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
//    
//    CGSize titleSize = [title sizeWithFont:HELVETICANEUEMEDIUM_FONT(12.0f)];
//    [self.imageView setContentMode:UIViewContentModeCenter];
//    [self setImageEdgeInsets:UIEdgeInsetsMake(-8.0,
//                                              0.0,
//                                              0.0,
//                                              0.0)];
//    [self setImage:image forState:stateType];
//    
//    [self.titleLabel setContentMode:UIViewContentModeCenter];
//    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
//    [self.titleLabel setFont:HELVETICANEUEMEDIUM_FONT(12.0f)];
//    [self.titleLabel setTextColor:COLOR_ffffff];
//    [self setTitleEdgeInsets:UIEdgeInsetsMake(30.0,
//                                              0.0,
//                                              0.0,
//                                              0.0)];
//    [self setTitle:title forState:stateType];
//}

@end
