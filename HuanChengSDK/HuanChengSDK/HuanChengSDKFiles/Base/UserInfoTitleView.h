//
//  UserInfoTitleView.h
//  Daleel
//
//  Created by 陈嘉栋 on 2023/6/12.
//

#import "BaseView.h"

/**
 个人信息titleView
 */

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoTitleView : UIControl

/// 头像
@property (nonatomic, copy) NSString *headUrl;
/// 昵称
@property (nonatomic, copy) NSString *nickName;
/// 是否认证
@property (nonatomic, assign) BOOL isAuth;
/// 勋章url
@property (nonatomic, copy) NSString *badgeUrl;
/// nickname颜色
@property (nonatomic, strong) UIColor *textColor;

/// 初始化
/// - Parameters:
///   - headUrl: 头像url
///   - nickName: 昵称
///   - isAuth: 是否认证
///   - badgeUrl: 当前佩戴勋章url
- (instancetype)initWithHeadUrl:(NSString *)headUrl nickName:(NSString *)nickName isAuth:(BOOL)isAuth badgeUrl:(NSString *)badgeUrl;

@end

NS_ASSUME_NONNULL_END
