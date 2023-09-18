//
//  KeyCenter.m
//  Playhouse
//
//  Created by 陈嘉栋 on 2023/8/23.
//

#import "KeyCenter.h"

@implementation KeyCenter

+ (NSString *)thinkingServer {
    return @"http://77.242.243.108:8991/";
}

+ (NSString *)thinkingAppId {
#if DEBUG
    return @"debug-appid";
#else
    return @"5a33ec59c1404d18b95d93790bf93f54";
#endif
}

+ (NSString *)pangleAppId {
#if DEBUG
    return @"8025677";
#else
    return @"8177954";
#endif
}

+ (NSString *)openScreenId{
#if DEBUG
    return @"890000078";
#else
    return @"890036765";
#endif
}
+ (NSString *)rewardedAdId {
#if DEBUG
    return @"980088192";
#else
    return @"980664655";
#endif
}

+ (NSString *)appsflyerId {
    return @"qfTmHZoNDSLpBjGChzdu9T";
}

+ (NSString *)googleOpenScreenUnitId {
#if DEBUG
    return @"ca-app-pub-3940256099942544/5662855259";
#else
    return @"ca-app-pub-8176401385743342/3432187046";
#endif
}
+ (NSString *)googleRewardedUnitId {
#if DEBUG
    return @"ca-app-pub-3940256099942544/1712485313";
#else
    return @"ca-app-pub-8176401385743342/4884869512";
#endif
}
@end
