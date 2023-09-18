//
//  BaseNavController.m
//  Playhouse
//
//  Created by 杨鹏 on 2023/8/9.
//

#import "BaseNavController.h"

@interface BaseNavController ()

@end

@implementation BaseNavController


- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 15.0, *)) {
        [UITableView appearance].sectionHeaderTopPadding = 0;
    }
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.topViewController.preferredStatusBarStyle;
}
- (BOOL)prefersStatusBarHidden {
    return self.topViewController.prefersStatusBarHidden;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count >= 1) {
        [self setBackButtonWithViewController:viewController];
    }
    [super pushViewController:viewController animated:animated];
}

- (NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    if (self.viewControllers.count > 1) {
        self.topViewController.hidesBottomBarWhenPushed = NO;
    }
    return [super popToRootViewControllerAnimated:animated];
}
- (void)setBackButtonWithViewController:(UIViewController *)vc {
    UIImage *image =  [LanguageTool isArabic] ? [[[UIImage imageNamed:@"icon_back_w"] yp_imageFlippedForRightToLeftLayoutDirection] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] : [[UIImage imageNamed:@"icon_back_w"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(popAction)];
    vc.navigationItem.leftBarButtonItem = backItem;
}

- (void)popAction {
    [self popViewControllerAnimated:YES];
}


@end
