//
//  UIView+Border.m
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/11/5.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "UIView+Border.h"
#import "UIView+PSSizes.h"
#import "Masonry.h"
@implementation UIView(Border)
#pragma mark 给视图某一个方向添加边框线
- (void)setBorder:(BorderDirect)borderDirect withColor:(UIColor *)color andWidth:(CGFloat)width
{
    __weak typeof(self) wSelf = self;
    
    if (borderDirect == topBorder) {
//        CALayer *layer = [CALayer layer];
//        layer.frame = CGRectMake(0, 0, self.frame.size.width, width);
//        layer.backgroundColor = color.CGColor;
//        [self.layer addSublayer:layer];
        UIView* view = [[UIView alloc]init];
        view.tag = topBorder;
        view.backgroundColor = color;
        [self addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.top.equalTo(@0);
            make.width.equalTo(wSelf);
            make.height.equalTo(@(width));
        }];
        
    }
    if (borderDirect == leftBorder) {
//        CALayer *layer = [CALayer layer];
//        layer.frame = CGRectMake(0, 0, width, self.frame.size.height);
//        layer.backgroundColor = color.CGColor;
//        [self.layer addSublayer:layer];
        UIView* view = [[UIView alloc]init];
        view.backgroundColor = color;
        [self addSubview:view];
        view.tag = leftBorder;
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.top.equalTo(@0);
            make.width.equalTo([NSNumber numberWithFloat:width]);
            make.height.equalTo(self);
        }];
    }
    if (borderDirect == bottomBorder) {
//        CALayer *layer = [CALayer layer];
//        layer.frame = CGRectMake(0, self.frame.size.height - width, self.frame.size.width, width);
//        layer.backgroundColor = color.CGColor;
//        [self.layer addSublayer:layer];
        UIView* view = [[UIView alloc]init];
        view.backgroundColor = color;
        [self addSubview:view];
        view.tag = bottomBorder;
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.top.equalTo(wSelf.mas_bottom).offset(-width);
            make.width.equalTo(wSelf);
            make.height.equalTo(@(width));
        }];
    }
    if (borderDirect == rightBorder) {
//        CALayer *layer = [CALayer layer];
//        layer.frame = CGRectMake(self.frame.size.width - width, 0, width, self.frame.size.height);
//        layer.backgroundColor = color.CGColor;
//        [self.layer addSublayer:layer];
        UIView* view = [[UIView alloc]init];
        view.backgroundColor = color;
        [self addSubview:view];
        view.tag = rightBorder;
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo([NSNumber numberWithFloat:self.width - width]);
            make.top.equalTo(@0);
            make.width.equalTo([NSNumber numberWithFloat:width]);
            make.height.equalTo([NSNumber numberWithFloat:self.height]);
        }];
    }
}

- (void)setBorder:(BorderDirect)borderDirect withColor:(UIColor *)color withWidth:(CGFloat)width withEdgeInsets:(UIEdgeInsets)edgeInsets
{
    if (borderDirect == topBorder) {
        UIView* view = [[UIView alloc]init];
        view.tag = topBorder;
        view.backgroundColor = color;
        [self addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(edgeInsets.left));
            make.top.equalTo(@0);
            make.right.equalTo(self).offset(edgeInsets.right);
            make.height.equalTo([NSNumber numberWithFloat:width]);
        }];
        
    }
    if (borderDirect == leftBorder) {
        UIView* view = [[UIView alloc]init];
        view.backgroundColor = color;
        [self addSubview:view];
        view.tag = leftBorder;
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.top.equalTo(@(edgeInsets.top));
            make.width.equalTo([NSNumber numberWithFloat:width]);
            make.bottom.equalTo(self).offset(edgeInsets.bottom);
        }];
    }
    if (borderDirect == bottomBorder) {
        UIView* view = [[UIView alloc]init];
        view.backgroundColor = color;
        [self addSubview:view];
        view.tag = bottomBorder;
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(edgeInsets.left));
            make.top.equalTo([NSNumber numberWithFloat:self.height - width*2]);
            make.right.equalTo(self.mas_right).offset(edgeInsets.right);
            make.height.equalTo([NSNumber numberWithFloat:width]);
        }];
    }
    if (borderDirect == rightBorder) {
        UIView* view = [[UIView alloc]init];
        view.backgroundColor = color;
        [self addSubview:view];
        view.tag = rightBorder;
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo([NSNumber numberWithFloat:self.width - width]);
            make.top.equalTo(@(edgeInsets.top));
            make.width.equalTo([NSNumber numberWithFloat:width]);
            make.bottom.equalTo(self).offset(edgeInsets.bottom);
        }];
    }
}

-(void)removeBorder:(BorderDirect)borderDirect
{
    for (UIView *subView in self.subviews)
    {
        if(subView.tag == borderDirect)
        {
            [subView removeFromSuperview];
            break;
        }
    }
}

@end
