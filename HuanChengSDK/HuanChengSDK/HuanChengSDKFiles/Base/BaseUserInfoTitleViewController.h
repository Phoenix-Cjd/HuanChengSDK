//
//  BaseUserInfoTitleViewController.h
//  Daleel
//
//  Created by 陈嘉栋 on 2023/6/12.
//

#import "BaseViewController.h"
#import "UserInfoTitleView.h"

/**
 导航栏中间带有
 */

NS_ASSUME_NONNULL_BEGIN

@interface BaseUserInfoTitleViewController : BaseViewController

/// 用户信息titleView
@property (nonatomic, strong) UserInfoTitleView *userInfoTitleView;

/// 添加用户信息titleView
/// - Parameters:
///   - headUrl: 头像url
///   - nickName: 昵称
///   - isAuth: 是否认证
///   - badgeUrl: 当前佩戴勋章url
- (void)addUserInfoTitleView:(NSString *)headUrl nickName:(NSString *)nickName isAuth:(BOOL)isAuth badgeUrl:(NSString *)badgeUrl;

/// 点击用户信息titleView
- (void)clickedUserInfoTitleView;

@end

NS_ASSUME_NONNULL_END
