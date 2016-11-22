//
//  DAttributedString.m
//  Duwa
//
//  Created by Arthur on 2016/11/22.
//  Copyright © 2016年 miduotek. All rights reserved.
//

#import "DAttributedString.h"

@implementation DAttributedString
/**
 *  return 返回封装后的NSMutableAttributedString,添加了默认NSParagraphStyleAttributeName与NSFontAttributeName属性
 *
 *  @param labelStr  NSString
 *  @param labelDic  属性字典
     @{
         NSFontAttributeName://(字体)
         NSBackgroundColorAttributeName://(字体背景色)
         NSForegroundColorAttributeName://(字体颜色)
         NSParagraphStyleAttributeName://(段落)
         NSLigatureAttributeName://(连字符)
         NSKernAttributeName://(字间距)
         NSStrikethroughStyleAttributeName://NSUnderlinePatternSolid(实线) | NSUnderlineStyleSingle(删除线)
         NSUnderlineStyleAttributeName://(下划线)
         NSStrokeColorAttributeName://(边线颜色)
         NSStrokeWidthAttributeName://(边线宽度)
         NSShadowAttributeName://(阴影)
         NSVerticalGlyphFormAttributeName://(横竖排版)
     }
 *
 *  @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)getNSAttributedString:(NSString *)labelStr labelDict:(NSDictionary *)labelDic
{
    NSMutableAttributedString *atrString = [[NSMutableAttributedString alloc] initWithString:labelStr];
    NSRange range = NSMakeRange(0, atrString.length);
    if (labelDic && labelDic.count > 0) {
        NSEnumerator *enumerator = [labelDic keyEnumerator];
        id key;
        while ((key = [enumerator nextObject])) {
            [atrString addAttribute:key value:labelDic[key] range:range];
        }
    }
    //段落属性
    NSMutableParagraphStyle *paragraphStyle = labelDic[NSParagraphStyleAttributeName];
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
        [atrString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    }
    //字体
    UIFont *font = labelDic[NSFontAttributeName];
    if (!font || nil == font) {
        font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
        [atrString addAttribute:NSFontAttributeName value:font range:range];
    }
    return atrString;
}
@end
