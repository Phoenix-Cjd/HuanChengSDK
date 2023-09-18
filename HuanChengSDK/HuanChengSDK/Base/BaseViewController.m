//
//  BaseViewController.m
//  Daleel
//
//  Created by mac on 2022/11/22.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) NSMutableArray <UIBarButtonItem *> *navRightBarBtnItems;

@end

@implementation BaseViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(0x121216);
    self.hbd_titleTextAttributes = @{
        NSFontAttributeName:kFontSemibold(18),
        NSForegroundColorAttributeName:[UIColor whiteColor]
    };
    self.hbd_barTintColor = RGB(0x121216);
    self.hbd_barShadowHidden = YES;
    
    [self initialize];
    [self setupViews];
    [self bindSignal];
    [self requestData];
}

/// int
- (void)initialize {}
#pragma mark - UI
- (void)setupViews {}
///Rac 绑定信号
- (void)bindSignal {}
#pragma mark - Data
/// 网络请求
- (void)requestData {}

- (void)setNavigationTitle:(NSString *)navigationTitle {
    _navigationTitle = navigationTitle;
    self.navigationItem.title = navigationTitle;
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}




/// 下拉刷新和上拉加载更多的结果处理
- (void)endRefreshingWithOldArr:(NSMutableArray *)old freshArr:(NSArray *)fresh pageSize:(NSInteger)size scrollView:(UIScrollView *)scrollV {
    RefreshState state;
    if (self.cpge == 0) {
        if (fresh.count >= size) {
            state = HeaderRefresh_HasMoreData;
        }else if (fresh.count > 0 && fresh.count < size) {
            state = HeaderRefresh_HasNoMoreData;
        }else {
            state = HeaderRefresh_HasNoData;
        }
        if ([old isKindOfClass:[NSMutableArray class]]) {
            [old removeAllObjects];
        }
    }else {
        state = FooterRefresh_HasMoreData;
    }
    if ([old isKindOfClass:[NSMutableArray class]] && fresh) {
        [old addObjectsFromArray:fresh];
    }
    [self endRefreshingWithState:state scrollView:scrollV pageSize:size];
}
- (void)endRefreshingWithOldArr:(NSMutableArray *)old freshArr:(NSArray *)fresh scrollView:(UIScrollView *)scrollV {
    [self endRefreshingWithOldArr:old freshArr:fresh pageSize:kPageSize scrollView:scrollV];
}
- (void)endRefreshingWithState:(RefreshState)state scrollView:(UIScrollView *)scrollV pageSize:(NSInteger)size {
    @weakify(self);
    [RefreshManager endRefreshingWithState:state scrollView:scrollV footerRefreshingBlock:^{
        @strongify(self);
        if (self.refreshingBlock) {
            self.refreshingBlock();
        }else {
            self.cpge++;
            [self requestData];
        }
    }];
}
- (void)endRefreshingWithState:(RefreshState)state scrollView:(UIScrollView *)scrollV {
    [self endRefreshingWithState:state scrollView:scrollV pageSize:kPageSize];
}
- (void)endRefreshingFailedWithScrollView:(UIScrollView *)scrollV pageSize:(NSInteger)size {
    if (self.cpge > 1) {
        self.cpge--;
    }
    [self endRefreshingWithState:RefreshError scrollView:scrollV];
}
- (void)endRefreshingFailedWithScrollView:(UIScrollView *)scrollV {
    [self endRefreshingFailedWithScrollView:scrollV pageSize:kPageSize];
}

@end
