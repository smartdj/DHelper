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
- (void)addPullDownHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action;
- (void)addPullUpFooterWithRefreshingTarget:(id)target refreshingAction:(SEL)action;
@end
