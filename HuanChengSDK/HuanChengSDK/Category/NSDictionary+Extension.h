//
//  NSDictionary+Extension.h
//  Gamfun
//
//  Created by 杨鹏 on 2022/6/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Extension)

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
+ (NSDictionary *)dictionaryForJsonData:(NSData *)jsonData;

@end

NS_ASSUME_NONNULL_END
