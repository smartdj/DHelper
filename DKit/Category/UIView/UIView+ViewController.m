//
//  UIView+ViewController.m
//  Duwa
//
//  Created by Arthur on 2016/11/24.
//  Copyright © 2016年 miduotek. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)
/**
 * @abstract view's viewController if the view has one
 */
- (UIViewController *)viewController {
    return (UIViewController *)[self nextResponderWithClass:UIViewController.class];
}

/**
 * @abstract 递归查找view的nextResponder，直到找到类型为class的Responder
 *
 * @param class  nextResponder 的 class
 * @return       第一个满足类型为class的UIResponder
 */
- (UIResponder *)nextResponderWithClass:(Class) class {
    UIResponder *nextResponder = self;
    while (nextResponder) {
        nextResponder = nextResponder.nextResponder;
        if ([nextResponder isKindOfClass:class]) {
            return nextResponder;
        }
    }
    return nil;
}

- (UIResponder *)findFirstResponder {
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        id responder = [subView findFirstResponder];
        if (responder) {
            return responder;
        }
    }
    return nil;
}
@end
