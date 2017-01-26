//
//  UITableView+MJRefresh.m
//  Duwa
//
//  Created by Arthur on 2016/11/25.
//  Copyright © 2016年 miduotek. All rights reserved.
//

#import "UITableView+MJRefresh.h"


@implementation UITableView (MJRefresh)
- (void)addPullDownHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action
{
    //中文
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
    
    header.automaticallyChangeAlpha = YES;// 设置自动切换透明度(在导航栏下面自动隐藏)
    header.stateLabel.hidden = YES;// 隐藏状态
    header.lastUpdatedTimeLabel.hidden = YES;// 隐藏时间
    
    self.mj_header = header;
}

//上拉加载更多
- (void)addPullUpFooterWithRefreshingTarget:(id)target refreshingAction:(SEL)action
{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
    self.mj_footer = footer;
}

@end
