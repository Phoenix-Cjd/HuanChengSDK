//
//  RefreshHeader.m
//  Gamfun
//
//  Created by 杨鹏 on 2022/8/5.
//

#import "RefreshHeader.h"

@implementation RefreshHeader

+ (MJRefreshHeader *)headerWithRefreshingBlock:(RefreshBlock)refreshBlock {
    return [self normalHeaderWithRefreshingBlock:refreshBlock];
}

+ (MJRefreshNormalHeader *)normalHeaderWithRefreshingBlock:(RefreshBlock)refreshBlock {
    MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (refreshBlock) {
            refreshBlock();
        }
    }];
    refreshHeader.ignoredScrollViewContentInsetTop = -10;
    refreshHeader.lastUpdatedTimeLabel.hidden = YES;
    [refreshHeader setTitle:kLocalize(@"srl_header_pulling") forState:MJRefreshStateIdle];
    [refreshHeader setTitle:kLocalize(@"srl_header_refreshing") forState:MJRefreshStateRefreshing];
    [refreshHeader setTitle:kLocalize(@"srl_header_release") forState:MJRefreshStatePulling];
    
    return refreshHeader;
}


@end
