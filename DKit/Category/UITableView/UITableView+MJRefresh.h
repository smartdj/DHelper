//
//  UITableView+MJRefresh.h
//  Duwa
//
//  Created by Arthur on 2016/11/25.
//  Copyright © 2016年 miduotek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>

@interface UITableView (MJRefresh)
- (void)addPullDownHeaderWithTarget:(id)target action:(SEL)action;
- (void)addPullUpFooterWithTarget:(id)target action:(SEL)action;
@end
