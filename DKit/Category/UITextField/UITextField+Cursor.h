//
//  UITextField+Cursor.h
//  QiyuExplorer
//
//  Created by DJ on 15/12/11.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Cursor)
//设置光标选择的范围
- (void) setSelectedRange:(NSRange) range;
//光标选择的范围
- (NSRange)selectedRange;
@end
