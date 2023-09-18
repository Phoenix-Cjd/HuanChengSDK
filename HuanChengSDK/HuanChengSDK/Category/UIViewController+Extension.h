//
//  UIViewController+Extension.h
//  Gamfun
//
//  Created by 杨鹏 on 2022/6/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Extension)

+ (UIViewController *)rootViewController;
+ (UIViewController *)getCurrentViewController;
- (UIViewController *)uacb_topmost;
- (void)popAnimated;
- (void)popRootAnimated;
- (void)popToViewController:(NSString *)controller;
- (void)dismissViewController;
- (void)pushViewController:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
