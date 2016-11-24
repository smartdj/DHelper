//
//  UIView+ViewController.h
//  Duwa
//
//  Created by Arthur on 2016/11/24.
//  Copyright © 2016年 miduotek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ViewController)
/**
 * @abstract view's viewController if the view has one
 */
- (UIViewController *)viewController;

/**
 * @abstract 递归查找view的nextResponder，直到找到类型为class的Responder
 *
 * @param class  nextResponder 的 class
 * @return       第一个满足类型为class的UIResponder
 */
- (UIResponder *)nextResponderWithClass:(Class) class;

/// 查找firstResponder
- (UIResponder *)findFirstResponder;
@end
