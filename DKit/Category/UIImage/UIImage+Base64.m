//
//  UIImage+Base64.m
//  pangxie
//
//  Created by arthur on 2017/5/13.
//  Copyright © 2017年 yuntongda. All rights reserved.
//

#import "UIImage+Base64.h"

@implementation UIImage (Base64)

+ (UIImage *) base64ToImage: (NSString *) imgSrc
{
    if(imgSrc){
        NSData *data = [[NSData alloc] initWithBase64EncodedString:imgSrc
                                                           options:NSDataBase64DecodingIgnoreUnknownCharacters];
        
        UIImage *image = [UIImage imageWithData:data];
        return image;
    }else{
        return nil;
    }
}

- (NSString *) imageToBase64
{
    if(self){
        return [UIImagePNGRepresentation(self) base64EncodedStringWithOptions:0];
    }else{
        return nil;
    }
}
@end
