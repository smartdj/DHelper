//
//  UIBarButtonItem+PhoneReturnButton.m
//  LittleWhite
//
//  Created by gong on 16/3/25.
//  Copyright © 2016年 Arthur. All rights reserved.
//

#import "UIBarButtonItem+Category.h"

@implementation UIBarButtonItem (Category)

+ (instancetype)setUpReturnButtonaddTarget:(id)target action:(SEL)action
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *image = [[UIImage imageNamed:@"通用_返回"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    image = [image stretchableImageWithLeftCapWidth: 24 topCapHeight: 24];
    backButton.frame = CGRectMake(0, 0, image.size.width, image.size.height);

    [backButton setImage:image forState:UIControlStateNormal];
    return [[self alloc] initWithCustomView:backButton];
}

+ (instancetype)setUpButtonWithImage:(NSString *)imageName
                     selectImage:(NSString *)selectImageName
                           title:(NSString *)title
                           addTarget:(id)target
                              action:(SEL)action
{
    return [self setUpButtonWithImage:imageName
                      selectImage:selectImageName
                            title:title
                             size:CGSizeMake(65, 30)
                            addTarget:target
                               action:action];
}

+ (instancetype)setUpButtonWithImage:(NSString *)imageName
                     selectImage:(NSString *)selectImageName
                           title:(NSString *)title
                            size:(CGSize)size
                           addTarget:(id)target
                              action:(SEL)action
{
    return [self setUpButtonWithImage:imageName
                      selectImage:selectImageName
                            title:title
                             size:size
                       titleColor:[UIColor whiteColor]
                            addTarget:target
                               action:action];
}

+ (instancetype)setUpButtonWithImage:(NSString *)imageName
                     selectImage:(NSString *)selectImageName
                           title:(NSString *)title
                            size:(CGSize)size
                      titleColor:(UIColor *)color
                           addTarget:(id)target action:(SEL)action
{
    return [self setUpButtonWithImage:imageName
                      selectImage:selectImageName
                            title:title
                         fontSize:16
                             size:size
                       titleColor:color
                            addTarget:target
                               action:action];
}

+ (instancetype)setUpButtonWithImage:(NSString *)imageName
                     selectImage:(NSString *)selectImageName
                           title:(NSString *)title
                        fontSize:(CGFloat)fontSize
                            size:(CGSize)size
                      titleColor:(UIColor *)color
                           addTarget:(id)target action:(SEL)action
{
    UIButton *rightButton = nil;
    rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, size.width, size.height);
    if(title)
    {
        rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [rightButton setTitle:title forState:UIControlStateNormal];
        [rightButton setTitle:title forState:UIControlStateSelected];
//        [rightButton sizeToFit];
    }
    
    [rightButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    if(imageName)
    {
        UIImage *normalImage = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        if(normalImage)
             [rightButton setImage:normalImage forState:UIControlStateNormal];
    }
    
    if(selectImageName)
    {
        UIImage *selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        if(selectedImage)
            [rightButton setImage:selectedImage forState:UIControlStateSelected];
    }
   
    return [[self alloc] initWithCustomView:rightButton];
}
@end
