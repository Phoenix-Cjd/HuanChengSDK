//
//  UIImageView+Extension.h
//  Gamfun
//
//  Created by 杨鹏 on 2022/6/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Extension)

- (void)loadImgUrl:(NSString *_Nullable)url;
- (void)loadImgUrl:(NSString *_Nullable)url placeholderImg:(NSString *_Nullable)img;


@end

NS_ASSUME_NONNULL_END
