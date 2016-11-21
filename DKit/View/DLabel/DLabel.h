//
//  UILabel+TopLeftLabel.h
//  Duwa
//
//  Created by Arthur on 2016/11/18.
//  Copyright © 2016年 miduotek. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface DLabel:UILabel
@property (nonatomic) VerticalAlignment verticalAlignment;
@end
