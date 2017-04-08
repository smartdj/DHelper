//
//  UIView+SubViewRect.m
//  pangxie
//
//  Created by arthur on 2017/4/7.
//  Copyright © 2017年 yuntongda. All rights reserved.
//

#import "UIView+Rect.h"

@implementation UIView (Rect)
- (void)setAllSubViewRect:(CGRect)rect{
    self.frame = rect;
    
    for(UIView *subview in self.subviews){
        subview.frame = rect;
        if(subview.subviews && subview.subviews.count > 0){
            [subview setAllSubViewRect:rect];
        }
    }
}
@end
