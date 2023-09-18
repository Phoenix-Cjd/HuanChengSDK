//
//  UIImageView+Extension.m
//  Gamfun
//
//  Created by 杨鹏 on 2022/6/10.
//

#import "UIImageView+Extension.h"

@implementation UIImageView (Extension)

/// yp - 加载带占位图的头像
- (void)loadImgUrl:(NSString *_Nullable)url {
    [self loadImgUrl:url placeholderImg:@"avatar_normal"];
}

/// yp - 加载图片 需要指定占位图
- (void)loadImgUrl:(NSString *_Nullable)url placeholderImg:(NSString *_Nullable)img {
    if (!url || url.length == 0) {
        if (img) {
            self.image = [UIImage imageNamed:img];
        }
        return;
    }
    if (img) {
        [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:img]];
    }else {
        [self sd_setImageWithURL:[NSURL URLWithString:url]];
    }
}

@end
