//
//  NSString+Extension.h
//  Gamfun
//
//  Created by 杨鹏 on 2022/6/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

+ (id)convertToObject:(NSString *)jsonString;
+ (NSString *)convertToJsonStr:(id)object;
+ (NSString *)convertToJsonStr:(id)object hasSpace:(BOOL)hasSpace;
+ (CGSize)sizeForString:(NSString*)content font:(UIFont*)font maxWidth:(CGFloat) maxWidth;

- (CGSize)singleLineSizeWithText:(UIFont *)font;
+ (BOOL)isEmpty:(NSString *)str;
+ (BOOL)isFirstEmpty:(NSString *)str;
+ (BOOL)isAllEmpty:(NSString *)str;

/// 金额转换
+ (NSString *)stringChangeMoneyWithStr:(NSString *)str;

/**
 防止原生emoji表情被截断
 */
+ (NSString *)subStringWith:(NSString *)string index:(NSInteger)index;
+ (NSString *)subStringWith:(NSString *)string index:(NSInteger)index hasToast:(BOOL)hasToast;

+ (NSString *)translatNum:(NSString *)arebic;

/// 传入秒 得到分秒
+ (NSString *)getMMSSFromSS:(NSTimeInterval)totalTime;
/// 传入秒 得到时分秒
+ (NSString *)getHMMSFromSS:(NSTimeInterval)totalTime;
@end

NS_ASSUME_NONNULL_END
