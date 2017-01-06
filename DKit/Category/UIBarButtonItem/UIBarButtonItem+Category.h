//
//  UIBarButtonItem+PhoneReturnButton.h
//  LittleWhite
//
//  Created by gong on 16/3/25.
//  Copyright © 2016年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Category)
//Nav返回按钮
+ (instancetype)setUpReturnButtonaddTarget:(id)target action:(SEL)action;

//按钮
+ (instancetype)setUpButtonWithImage:(NSString *)imageName
                         selectImage:(NSString *)selectImageName
                               title:(NSString *)title
                           addTarget:(id)target
                              action:(SEL)action;

+ (instancetype)setUpButtonWithImage:(NSString *)imageName
                         selectImage:(NSString *)selectImageName
                               title:(NSString *)title
                                size:(CGSize)size
                           addTarget:(id)target
                              action:(SEL)action;

+ (instancetype)setUpButtonWithImage:(NSString *)imageName
                         selectImage:(NSString *)selectImageName
                               title:(NSString *)title
                                size:(CGSize)size
                          titleColor:(UIColor *)color
                           addTarget:(id)target
                              action:(SEL)action;

+ (instancetype)setUpButtonWithImage:(NSString *)imageName
                         selectImage:(NSString *)selectImageName
                               title:(NSString *)title
                        fontSize:(CGFloat)fontSize
                                size:(CGSize)size
                          titleColor:(UIColor *)color
                           addTarget:(id)target action:(SEL)action;

@end
