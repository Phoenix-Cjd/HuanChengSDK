//
//  UIImage+Extension.h
//  Gamfun
//
//  Created by 杨鹏 on 2022/9/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)

- (UIImage *)yp_imageFlippedForRightToLeftLayoutDirection;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
