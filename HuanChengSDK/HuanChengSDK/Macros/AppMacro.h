//
//  AppMacro.h
//  Gamfun
//
//  Created by 杨鹏 on 2022/6/2.
//

#ifndef AppMacro_h
#define AppMacro_h

// 网络请求url拼接
#define URL(path) [NSString stringWithFormat:@"%@%@",kRequestServerDomain, path]
#define WEBURL(path) [NSString stringWithFormat:@"%@/%@",kRequestWebDomain, path]

/// 是否加密
#define isEntry NO

/// yp - 打印请写 DLog
#if DEBUG
#define DLog(fmt, ...) NSLog((@"[Function:%s\n - Line:%d] \n" fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

#define ExecBlock(block, ...) if (block) { block(__VA_ARGS__); }


#define kLocalize(key) NSLocalizedString(key, nil)
#define kImageName(imageName) [UIImage imageNamed:imageName]
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define Is_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
/// yp - 是否为iPad
#define IS_IPAD [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad
/// yp - 是否是x系列
#define Is_Iphone_X (Is_Iphone && (double)kScreenHeight - (double)812 >= 0.0)
/// yp - 导航栏高度
#define kHeight_NavBar  (Is_Iphone_X ? 88 : 64)
/// yp - 状态栏高度
#define kHeight_StatusBar (Is_Iphone_X ? 44 : 20)
/// yp - tabbar高度
#define kHeight_Tabbar (Is_Iphone_X ? 90 : 49)
/// yp - iphoneX tabbar额外高度
#define kHeight_Tabbar_Extra (Is_Iphone_X ? 34 : 0)
/// yp - iphoneX 底部安全距离
#define kHeight_Bottom_Extra (Is_Iphone_X ? 13 : 0)

/// yp - 本地持久化宏
#define kUSER_DEFAULT [NSUserDefaults standardUserDefaults]
/// yp - 存
#define kUDSetObjForKey(VALUE,KEY)  [kUSER_DEFAULT setObject:VALUE forKey:KEY]
/// yp - 取
#define kUDObjForKey(KEY)     [kUSER_DEFAULT objectForKey:KEY]

/// 无特殊需求 toast
#define kToast(x) [ToastTool showToast:x]

#define kPageSize 10
#define kUserDefaults  [NSUserDefaults standardUserDefaults]

/**
 *  打开Url
 */
UIKIT_STATIC_INLINE void openUrl(NSString *url , NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *options) {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:options completionHandler:^(BOOL success) {
    }];
}


#endif /* AppMacro_h */
