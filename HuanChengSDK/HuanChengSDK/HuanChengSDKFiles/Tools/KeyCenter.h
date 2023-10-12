//
//  KeyCenter.h
//  Playhouse
//
//  Created by 陈嘉栋 on 2023/8/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KeyCenter : NSObject

+ (NSString *)thinkingAppId;
+ (NSString *)thinkingServer;
+ (NSString *)pangleAppId;
+ (NSString *)openScreenId;
+ (NSString *)rewardedAdId;
+ (NSString *)appsflyerId;


+ (NSString *)googleOpenScreenUnitId;
+ (NSString *)googleRewardedUnitId;
@end

NS_ASSUME_NONNULL_END
