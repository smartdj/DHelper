//
//  UITextView+Category.m
//  XiaoBaiGe
//
//  Created by Arthur on 16/9/13.
//  Copyright © 2016年 Arthur. All rights reserved.
//

#import "UITextView+Category.h"

@implementation UITextView (Category)
- (NSInteger)numberOfLines{
    NSLayoutManager *layoutManager = [self layoutManager];
    
    NSInteger numberOfLines, index, numberOfGlyphs = [layoutManager numberOfGlyphs];
    
    NSRange lineRange;
    
    for (numberOfLines = 0, index = 0; index < numberOfGlyphs; numberOfLines++){
        (void) [layoutManager lineFragmentRectForGlyphAtIndex:index
                                               effectiveRange:&lineRange];
        index = NSMaxRange(lineRange);
    }
    return numberOfLines;
}
@end
