//
//  UITextField+Cursor.m
//  QiyuExplorer
//
//  Created by DJ on 15/12/11.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "UITextField+Cursor.h"

@implementation UITextField (Cursor)
/**
 *  光标选择的范围
 *
 *  @return 获取光标选择的范围
 */
- (NSRange)selectedRange{
    //开始位置
    UITextPosition* beginning = self.beginningOfDocument;
    //光标选择区域
    UITextRange* selectedRange = self.selectedTextRange;
    //选择的开始位置
    UITextPosition* selectionStart = selectedRange.start;
    //选择的结束位置
    UITextPosition* selectionEnd = selectedRange.end;
    //选择的实际位置
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    //选择的长度
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    return NSMakeRange(location, length);
}

/**
 *  设置光标选择的范围
 *
 *  @param range 光标选择的范围
 */
- (void) setSelectedRange:(NSRange) range
{
    UITextPosition* beginning = self.beginningOfDocument;
    UITextPosition* startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition* endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange* selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}
@end
