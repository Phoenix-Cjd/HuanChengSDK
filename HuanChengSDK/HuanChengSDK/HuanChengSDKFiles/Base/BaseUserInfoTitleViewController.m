//
//  BaseUserInfoTitleViewController.m
//  Daleel
//
//  Created by 陈嘉栋 on 2023/6/12.
//

#import "BaseUserInfoTitleViewController.h"

@interface BaseUserInfoTitleViewController ()

@end

@implementation BaseUserInfoTitleViewController

/// 添加用户信息titleView
/// - Parameters:
///   - headUrl: 头像url
///   - nickName: 昵称
///   - isAuth: 是否认证
///   - badgeUrl: 当前佩戴勋章url
- (void)addUserInfoTitleView:(NSString *)headUrl nickName:(NSString *)nickName isAuth:(BOOL)isAuth badgeUrl:(NSString *)badgeUrl {
    self.userInfoTitleView = [[UserInfoTitleView alloc] initWithHeadUrl:headUrl nickName:nickName isAuth:isAuth badgeUrl:badgeUrl];
    @weakify(self)
    [[self.userInfoTitleView rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self)
        [self clickedUserInfoTitleView];
    }];
    self.navigationItem.titleView = self.userInfoTitleView;
}

/// 点击用户信息titleView
- (void)clickedUserInfoTitleView {
    
}



@end
