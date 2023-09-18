//
//  RefreshHeader.h
//  Gamfun
//
//  Created by 杨鹏 on 2022/8/5.
//

#import <Foundation/Foundation.h>
#import <MJRefresh/MJRefresh.h>

NS_ASSUME_NONNULL_BEGIN

@interface RefreshHeader : NSObject

/**
 常用下拉控件
 */
+ (MJRefreshHeader *)headerWithRefreshingBlock:(RefreshBlock)refreshBlock;

/**
 正常的下拉控件
 */
+ (MJRefreshNormalHeader *)normalHeaderWithRefreshingBlock:(RefreshBlock)refreshBlock;

@end

NS_ASSUME_NONNULL_END
