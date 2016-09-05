//
//  UIView+GestureRecognizer.h
//  QiyuExplorer
//
//  Created by DJ on 16/1/22.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GestureRecognizer)
-(void)addSingleTapGestureRecognizerWithTarget:(id)target withAction:(SEL)selector;

-(void)addLongPressGestureRecognizerWithTarget:(id)target withAction:(SEL)selector;
@end
