//
//  UILabel+Category.m
//  Duwa
//
//  Created by Arthur on 2016/11/22.
//  Copyright © 2016年 miduotek. All rights reserved.
//

#import "UILabel+Category.h"
#import <tgmath.h>

@implementation UILabel (Category)

/*  return 动态返回字符串size大小
 *
 *  @param aString 字符串
 *  @param width   指定宽度
 *  @param height  指定宽度
 *
 *  @return CGSize
 */
- (CGSize)stringRect:(NSAttributedString *)string maxSize:(CGSize)maxSize
{
    if([string.string isEqualToString:@""]){
        return CGSizeZero;
    }
    
    CGSize size = CGSizeZero;
    NSMutableAttributedString *atrString = [[NSMutableAttributedString alloc] initWithAttributedString:string];
    NSRange range = NSMakeRange(0, atrString.length);
    
    //获取指定位置上的属性信息，并返回与指定位置属性相同并且连续的字符串的范围信息。
    NSDictionary* dic = [atrString attributesAtIndex:0 effectiveRange:&range];
    //不存在段落属性，则存入默认值
    NSMutableParagraphStyle *paragraphStyle = dic[NSParagraphStyleAttributeName];
    if (!paragraphStyle || nil == paragraphStyle) {
        paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineSpacing = 0.0;//增加行高
        paragraphStyle.headIndent = 0;//头部缩进，相当于左padding
        paragraphStyle.tailIndent = 0;//相当于右padding
        paragraphStyle.lineHeightMultiple = 0;//行间距是多少倍
        paragraphStyle.alignment = NSTextAlignmentLeft;//对齐方式
        paragraphStyle.firstLineHeadIndent = 0;//首行头缩进
        paragraphStyle.paragraphSpacing = 0;//段落后面的间距
        paragraphStyle.paragraphSpacingBefore = 0;//段落之前的间距
        paragraphStyle.lineBreakMode = self.lineBreakMode;
        [atrString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    }
    
    //设置默认字体属性
    UIFont *font = dic[NSFontAttributeName];
    if (!font || nil == font) {
        font = self.font;
        [atrString addAttribute:NSFontAttributeName value:font range:range];
    }
    
    NSMutableDictionary *attDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    [attDic setObject:font forKey:NSFontAttributeName];
    [attDic setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    CGSize strSize = [[string string] boundingRectWithSize:maxSize
                                                   options:options
                                                attributes:attDic
                                                   context:nil].size;
    
    size = CGSizeMake(ceil(strSize.width), ceil(strSize.height));
    return size;
}

/**
 *  返回UILabel自适应后的size
 *
 *  @param aString 字符串
 *  @param width   指定宽度
 *  @param height  指定高度
 *
 *  @return CGSize
 */
+ (CGSize)sizeLabelToFit:(NSAttributedString *)aString width:(CGFloat)width height:(CGFloat)height {
    UILabel *tempLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    tempLabel.attributedText = aString;
    tempLabel.numberOfLines = 0;
    [tempLabel sizeToFit];
    CGSize size = tempLabel.frame.size;
    size = CGSizeMake(ceil(size.width), ceil(size.height));
    return size;
}
@end
