//
//  NSString+Size.m
//  pangxie
//
//  Created by arthur on 2017/8/26.
//  Copyright © 2017年 yuntongda. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)
-(CGSize)calcSizeWithFontSize:(CGFloat)fontSize withFontSpacing:(CGFloat)fontSpacing withLineSpacing:(CGFloat)lineSpacing withMaxSize:(CGSize)maxSize{
    if(self.length == 0){
        return CGSizeZero;
    }
    //设置字间距
    NSDictionary *dic = @{NSKernAttributeName:@(fontSpacing)};
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self attributes:dic];
    
    //行间距
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    //设置字体大小
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(0, [self length])];
    
    NSRange range = NSMakeRange(0, attributedString.length);
    dic = [attributedString attributesAtIndex:0 effectiveRange:&range];
    UIFont *font = dic[NSFontAttributeName];
    
    NSMutableDictionary *attDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    [attDic setObject:font forKey:NSFontAttributeName];
    [attDic setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    CGSize strSize = [self boundingRectWithSize:maxSize
                                        options:options
                                     attributes:attDic
                                        context:nil].size;
    
    return CGSizeMake(ceil(strSize.width), ceil(strSize.height));;
}
@end
