//
//  BaseViewController.h
//  Daleel
//
//  Created by mac on 2022/11/22.
//

#import <UIKit/UIKit.h>
#import "RefreshDefine.h"


NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

/// yp - init
- (void)initialize;
/// yp-   UI
- (void)setupViews;
/// yp-  Rac 绑定信号
- (void)bindSignal;
/// yp- 网络请求
- (void)requestData;

@property (nonatomic, assign) NSInteger cpge;
@property (nonatomic, copy) NSString *navigationTitle;
@property (nonatomic, copy) void (^refreshingBlock) (void);

//下拉刷新和上拉加载更多的结果处理
- (void)endRefreshingWithOldArr:(NSMutableArray *)old freshArr:(NSArray *_Nullable)fresh pageSize:(NSInteger)size scrollView:(UIScrollView *)scrollV;
- (void)endRefreshingWithOldArr:(NSMutableArray *)old freshArr:(NSArray *_Nullable)fresh scrollView:(UIScrollView *)scrollV;
- (void)endRefreshingWithState:(RefreshState)state scrollView:(UIScrollView *)scrollV pageSize:(NSInteger)size;
- (void)endRefreshingWithState:(RefreshState)state scrollView:(UIScrollView *)scrollV;
//请求失败的结果处理
- (void)endRefreshingFailedWithScrollView:(UIScrollView *)scrollV pageSize:(NSInteger)size;
- (void)endRefreshingFailedWithScrollView:(UIScrollView *)scrollV;

@end

NS_ASSUME_NONNULL_END
