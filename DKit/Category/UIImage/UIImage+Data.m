//
//  UIImage+Data.m
//  QiyuExplorer
//
//  Created by DJ on 15/12/15.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "UIImage+Data.h"

@implementation UIImage (Data)
-(NSData*) pngData
{
    NSData *imageData = UIImagePNGRepresentation(self);
    return imageData;
}

-(NSData*) jpegData
{
    NSData *imageData = UIImageJPEGRepresentation(self, 1.0);
    return imageData;
}
@end
