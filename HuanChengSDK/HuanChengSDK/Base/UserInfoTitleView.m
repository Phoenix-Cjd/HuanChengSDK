//
//  UserInfoTitleView.m
//  Daleel
//
//  Created by 陈嘉栋 on 2023/6/12.
//

#import "UserInfoTitleView.h"

@interface UserInfoTitleView ()

/// 头像
@property (nonatomic, strong) UIImageView *headImageView;
/// 昵称
@property (nonatomic, strong) UILabel *nickNameLabel;
/// 认证标识
@property (nonatomic, strong) UIImageView *authImageView;
/// 勋章
@property (nonatomic, strong) UIImageView *badgeImageView;

@end

@implementation UserInfoTitleView

- (instancetype)initWithHeadUrl:(NSString *)headUrl nickName:(NSString *)nickName isAuth:(BOOL)isAuth badgeUrl:(NSString *)badgeUrl {
    if (self = [super initWithFrame:CGRectZero]) {
        
        [self addSubview:self.headImageView];
        [self addSubview:self.nickNameLabel];
        [self addSubview:self.authImageView];
        [self addSubview:self.badgeImageView];
        
        self.headUrl = headUrl;
        self.nickName = nickName;
        self.isAuth = isAuth;
        self.badgeUrl = badgeUrl;
        
        [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(24, 24));
            make.leading.top.bottom.equalTo(self);
        }];
        
        [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.headImageView);
            make.leading.equalTo(self.headImageView.mas_trailing).offset(4);
        }];
        
        [self.authImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.trailing.equalTo(self.headImageView);
        }];
        
        [self.badgeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.headImageView);
            make.leading.equalTo(self.nickNameLabel.mas_trailing).offset(4);
            make.trailing.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(16, 16));
        }];
        
    }
    return self;
}
#pragma mark - setter
/// 头像
- (void)setHeadUrl:(NSString *)headUrl {
    _headUrl = [headUrl copy];
    [self.headImageView loadImgUrl:headUrl placeholderImg:@"avatar_default"];
}
/// 昵称
- (void)setNickName:(NSString *)nickName {
    _nickName = [nickName copy];
    self.nickNameLabel.text = nickName;
}
/// 是否认证
- (void)setIsAuth:(BOOL)isAuth {
    _isAuth = isAuth;
    self.authImageView.hidden = !isAuth;
}
/// 当前佩戴勋章
- (void)setBadgeUrl:(NSString *)badgeUrl {
    _badgeUrl = [badgeUrl copy];
    [self.badgeImageView loadImgUrl:badgeUrl placeholderImg:@""];
}
- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.nickNameLabel.textColor = textColor;
}
#pragma mark - lazy load
- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
        _headImageView.layer.cornerRadius = 12;
        _headImageView.layer.masksToBounds = YES;
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _headImageView;
}
- (UILabel *)nickNameLabel {
    if (!_nickNameLabel) {
        _nickNameLabel = [UILabel labelWithTextFont:kFontMedium(16) textColor:RGB(0xffffff)];
    }
    return _nickNameLabel;
}
- (UIImageView *)authImageView {
    if (!_authImageView) {
        _authImageView = [[UIImageView alloc] initWithImage:kImageName(@"little_auth_icon")];
    }
    return _authImageView;
}
- (UIImageView *)badgeImageView {
    if (!_badgeImageView) {
        _badgeImageView = [[UIImageView alloc] init];
    }
    return _badgeImageView;
}
@end
