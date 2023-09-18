//
//  LanguageTool.m
//  Daleel
//
//  Created by mac on 2022/11/24.
//

#import "LanguageTool.h"

@implementation LanguageTool

+ (NSString *)currentLanguageName {
    NSString *currentLanguage = [[[NSBundle mainBundle] preferredLocalizations] firstObject];
    if ([currentLanguage containsString:@"zh"]) {
        currentLanguage = @"en";
    }
    return currentLanguage;
}

+ (BOOL)isArabic {
    NSString *currentLanguage = [LanguageTool currentLanguageName];
    return  [currentLanguage isEqualToString:@"ar"];
}

@end
