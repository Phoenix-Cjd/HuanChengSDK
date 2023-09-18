//
//  MainTabBarController.m
//  Daleel
//
//  Created by 陈嘉栋 on 2023/3/17.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (instancetype)init {
    UIEdgeInsets imageInsets = UIEdgeInsetsMake(5, 0, Is_Iphone_X ? -5 : 0, 0); ///UIEdgeInsetsMake(5, 0, -5, 0);
    UIOffset titlePositionAdjustment = UIOffsetMake(0, Is_Iphone_X ? 5 : 0);
    if (self = [super initWithViewControllers:[self viewControllersForTabBar]
                        tabBarItemsAttributes:[self tabBarItemsAttributesForTabBar]
                                  imageInsets:imageInsets
                      titlePositionAdjustment:titlePositionAdjustment
                                      context:nil
                ]) {
        [self customizeTabBarAppearanceWithTitlePositionAdjustment:titlePositionAdjustment];
        self.delegate = self;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([LanguageTool isArabic]) {
        [UITabBar appearance].semanticContentAttribute = UISemanticContentAttributeForceRightToLeft;
    }else {
        [UITabBar appearance].semanticContentAttribute = UISemanticContentAttributeForceLeftToRight;
    }
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
}

- (void)viewDidLayoutSubviews {
   [super viewDidLayoutSubviews];
   CGRect frame = self.tabBar.frame;
   frame.size.height = kHeight_Tabbar;
   frame.origin.y = self.view.bounds.size.height - kHeight_Tabbar;
   self.tabBar.frame = frame;
}

#pragma mark - Delegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
   UIImpactFeedbackGenerator *feedBackGenertor = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
   [feedBackGenertor impactOccurred];
    [self updateSelectionStatusIfNeededForTabBarController:tabBarController shouldSelectViewController:viewController shouldSelect:YES];
//    [USERMANAGER showLoginController];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
   UIView *animationView;
   if ([control cyl_isTabButton]) {
       animationView = [control cyl_tabImageView];
   }
   [self addScaleAnimationOnView:animationView repeatCount:1];
}

#pragma mark - Private
/// 缩放动画 需要实现的帧动画，这里根据需求自定义
- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount {
   dispatch_async(dispatch_get_main_queue(), ^{
       CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
       animation.keyPath = @"transform.scale";
       animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
       animation.duration = 1;
       animation.repeatCount = repeatCount;
       animation.calculationMode = kCAAnimationCubic;
       [animationView.layer addAnimation:animation forKey:nil];
   });
}

- (NSArray *)viewControllersForTabBar {
    // 剧场
//    PlayHouseController *firstViewController = [[PlayHouseController alloc] init];
//    BaseNavController *playHouseV = [[BaseNavController alloc] initWithRootViewController:firstViewController];
//
//    DramaController *dramaVC = [[DramaController alloc] init];
//    BaseNavController *dramaNav = [[BaseNavController alloc] initWithRootViewController:dramaVC];
//
//    //我的
//    MineController *secondViewController = [[MineController alloc] init];
//    BaseNavController *mineV = [[BaseNavController alloc] initWithRootViewController:secondViewController];
    return @[];
}

- (NSArray *)tabBarItemsAttributesForTabBar {
   NSDictionary *a = @{
                                                CYLTabBarItemTitle : kLocalize(@"theater"),
                                                CYLTabBarItemImage : [UIImage imageNamed:@"tab_home"],
                                                CYLTabBarItemSelectedImage : @"tab_home_s",

                                                };
    NSDictionary *b = @{
                                                 CYLTabBarItemTitle : kLocalize(@"bingewatch"),
                                                 CYLTabBarItemImage : [UIImage imageNamed:@"tab_drama"],
                                                 CYLTabBarItemSelectedImage : @"tab_drama_s",
                                                 };
    
    NSDictionary *c = @{
                                                 CYLTabBarItemTitle : kLocalize(@"me"),
                                                 CYLTabBarItemImage : [UIImage imageNamed:@"tab_m"],
                                                 CYLTabBarItemSelectedImage : @"tab_m_s",
                                                 };
   return @[a,b,c];
}

- (void)customizeTabBarAppearanceWithTitlePositionAdjustment:(UIOffset)titlePositionAdjustment {
    [self rootWindow].backgroundColor = RGB(0x121216);
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = RGB(0x666666);
    normalAttrs[NSFontAttributeName] = kFontRegular(12);
   
   NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
   selectedAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
   selectedAttrs[NSFontAttributeName] = kFontMedium(12);
   [UITabBar appearance].translucent = NO;
   
   if (@available(iOS 13.0, *)) {
       UITabBarItemAppearance *inlineLayoutAppearance = [[UITabBarItemAppearance  alloc] init];
       inlineLayoutAppearance.normal.titlePositionAdjustment = titlePositionAdjustment;
       [inlineLayoutAppearance.normal setTitleTextAttributes:normalAttrs];
       [inlineLayoutAppearance.selected setTitleTextAttributes:selectedAttrs];

       UITabBarAppearance *standardAppearance = [[UITabBarAppearance alloc] init];
       standardAppearance.stackedLayoutAppearance = inlineLayoutAppearance;
       standardAppearance.backgroundColor = RGB(0x121216);
       standardAppearance.shadowColor = RGB(0x121216);
       self.tabBar.standardAppearance = standardAppearance;
       
       if (@available(iOS 15.0, *)) {
           self.tabBar.scrollEdgeAppearance = standardAppearance;
       }
   } else {
       UITabBarItem *tabBar = [UITabBarItem appearance];
       [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
       [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
       [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
       [[UITabBar appearance] setShadowImage:[UIImage imageWithColor:RGB(0x121216) size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 1)]];
   }
}
@end
