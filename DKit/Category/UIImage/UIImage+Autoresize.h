//
//  UIImage+Autoresize.h
//  QiyuExplorer
//
//  Created by DJ on 16/1/13.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Autoresize)
#pragma mark - UIImage Initializer

/**
 * Method to override the UIImage::imageNamed: method with the retina4ImageNamed: one.
 * The new method and its implementation will be executed instead of the default UIImage::imageNamed:
 * The user don't need to do anything.
 */
+ (void)load;

/**
 * Returns a new UIImage object created from a filename.
 *
 * @discussion If needed, this method will automatically add the needed image suffix for the current device:
 * - "@2x"
 * - "-568h@2x"
 * - "-667h@2x"
 * - "@3x"
 * Important: the given filename should NOT contain any size-extension, only a name and its file type.
 *
 * @param imageName The NSString object representing the filename of the image.
 * @return An UIImage created from a given string.
 */
+ (UIImage *)dynamicImageNamed:(NSString *)imageName;
@end
