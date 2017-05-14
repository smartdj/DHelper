//
//  UIImage+Base64.h
//  pangxie
//
//  Created by arthur on 2017/5/13.
//  Copyright © 2017年 yuntongda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Base64)
- (NSString *) imageToBase64;
+ (UIImage *) base64ToImage: (NSString *) imgSrc;
@end
