//
//  NSString+Extension.m
//  Gamfun
//
//  Created by 杨鹏 on 2022/6/10.
//

#import "NSString+Extension.h"
#import <objc/runtime.h>

@implementation NSString (Extension)

+ (void)load {
    Method substringToIndex = class_getInstanceMethod(self, @selector(substringToIndex:));
    Method substringToIndexNew = class_getInstanceMethod(self, @selector(substringToIndexNew:));
    method_exchangeImplementations(substringToIndex, substringToIndexNew);
}

- (NSString *)substringToIndexNew:(NSInteger)index {
    if (self.length <= index) {
        return self;
    }
    NSRange rangeIndex = [self rangeOfComposedCharacterSequenceAtIndex:index];
    if (rangeIndex.length == 1) {
        NSRange rangeRange = [self rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, index)];
        return [self substringWithRange:rangeRange];
    }else {
        NSRange rangeRange = [self rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, index-1)];
        return [self substringWithRange:rangeRange];
    }
}


/// yp - 将json转化为NSDictionary或者NSArray
+ (id)convertToObject:(NSString *)jsonString {
    if (![jsonString isKindOfClass:[NSString class]] || !jsonString.length) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData  options:NSJSONReadingAllowFragments error:&error];
    if (jsonObject != nil && error == nil) {
        return jsonObject;
    }else {
        NSLog(@"json解析失败：%@",error);
        return nil;
    }
}

/// 对象转json字符串方法
+ (NSString *)convertToJsonStr:(id)object {
    return [self convertToJsonStr:object hasSpace:YES];
}

/// 对象转json字符串方法 hasSpace是否保留空格
+ (NSString *)convertToJsonStr:(id)object hasSpace:(BOOL)hasSpace {
    NSString *jsonString = nil;
    if (!object || ![NSJSONSerialization isValidJSONObject:object]) {
        return jsonString;
    }
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    if ([jsonData length] > 0 && error == nil) {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }else {
        NSLog(@"%@",error);
    }
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    if (!hasSpace) {
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return jsonString;
}

+ (CGSize)sizeForString:(NSString*)content font:(UIFont*)font maxWidth:(CGFloat) maxWidth{
    if (!content || content.length == 0) {
        return CGSizeMake(0, 0);
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary * attributes = @{NSFontAttributeName:font,NSParagraphStyleAttributeName: paragraphStyle};
    CGSize textRect = CGSizeMake(maxWidth, MAXFLOAT);
    CGSize textSize = [content boundingRectWithSize:textRect options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    return  textSize;
}

/// yp - 计算单行文本size
- (CGSize)singleLineSizeWithText:(UIFont *)font {
    return [self sizeWithAttributes:@{NSFontAttributeName:font}];
}

/// 是否有空格
+ (BOOL)isEmpty:(NSString *)str {
    NSRange range = [str rangeOfString:@" "];
  if (range.location != NSNotFound) {
    return YES;
  }else {
    return NO;
  }
}

+ (BOOL)isFirstEmpty:(NSString *)str {
    NSString *firstStr = [str substringToIndex:1];
    return [firstStr isEqualToString:@" "];
}

+ (BOOL)isAllEmpty:(NSString *)str {
    if (!str) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
    if ([trimedString length] == 0) {
        return YES;
     }else{
       return false;
     }
}

/// 金额的格式转换
+ (NSString *)stringChangeMoneyWithStr:(NSString *)str {
    // 判断是否null 若是赋值为0 防止崩溃
    if (([str isEqual:[NSNull null]] || str == nil || [str isEqualToString:@"0"])) {
        return @"0";
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *money = [formatter stringFromNumber:[NSNumber numberWithDouble:[str doubleValue]]];
    if (@available(iOS 14.0, *)) {
        if ([money containsString:@"."]) {
            money = [money stringByReplacingOccurrencesOfString:@"." withString:@","];
        }
    }
    return money;
}

/**
 防止原生emoji表情被截断
 */
+ (NSString *)subStringWith:(NSString *)string index:(NSInteger)index {
    return [self subStringWith:string index:index hasToast:NO];
}
+ (NSString *)subStringWith:(NSString *)string index:(NSInteger)index hasToast:(BOOL)hasToast {
    NSString *result = string;
    if (result.length > index) {
        NSRange rangeIndex = [result rangeOfComposedCharacterSequenceAtIndex:index];
        if (rangeIndex.length == 1) {
            result = [result substringToIndex:index];
        }else {
            NSRange rangeRange = [result rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, index)];
            result = [result substringWithRange:rangeRange];
        }
    }
    return result;
}

///阿语转换成阿拉伯数字
+ (NSString *)translatNum:(NSString *)arebic{
    NSString *str = arebic;

    NSArray *arNum = @[@"١",@"٢",@"٣",@"٤",@"٥",@"٦",@"٧",@"٨",@"٩",@"٠"];
    NSArray *chNum = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];

    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chNum forKeys:arNum];

    NSMutableArray *sums = [NSMutableArray array];

    for (int i = 0; i < str.length; i ++) {
        NSString *substr = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *sum = substr;
        if([arNum containsObject:substr]){
            sum = [dictionary objectForKey:substr];
        }
        [sums addObject:sum];
    }
    NSString *sumStr = [sums  componentsJoinedByString:@""];
    return sumStr;
}
//传入 秒  得到  xx分钟xx秒
+ (NSString *)getMMSSFromSS:(NSTimeInterval)totalTime{
    NSInteger seconds = totalTime;
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",seconds/60];
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    return format_time;
}
+ (NSString *)getHMMSFromSS:(NSTimeInterval)totalTime {
    NSInteger seconds = totalTime;
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    return format_time;
}

@end
