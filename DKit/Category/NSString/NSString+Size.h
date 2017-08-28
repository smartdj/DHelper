//
//  NSString+Size.h
//  pangxie
//
//  Created by arthur on 2017/8/26.
//  Copyright © 2017年 yuntongda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)
-(CGSize)calcSizeWithFontSize:(CGFloat)fontSize withFontSpacing:(CGFloat)fontSpacing withLineSpacing:(CGFloat)lineSpacing withMaxSize:(CGSize)maxSize;
@end
