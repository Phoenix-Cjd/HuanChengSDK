//
//  FontTools.h
//  Playhouse
//
//  Created by 杨鹏 on 2023/8/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define Font(fontName, float) [FontTools fontWithName:fontName withFontSize:float]
#define kFontBold(float) [FontTools fontBold:float]
#define kFontSemibold(float) [FontTools fontSemibold:float]
#define kFontMedium(float) [FontTools fontMedium:float]
#define kFontRegular(float) [FontTools fontRegular:float]
#define kFontHeavy(float) [FontTools fontHeavy:float]
#define kFontDinBlack(float) [FontTools fontDinBlack:float]
#define kFontDinBold(float) [FontTools fontDinBold:float]

@interface FontTools : NSObject

+ (UIFont *)fontWithName:(NSString *)name withFontSize:(float)fontSize;
+ (UIFont *)fontBold:(float)fontSize;
+ (UIFont *)fontSemibold:(float)fontSize;
+ (UIFont *)fontMedium:(float)fontSize;
+ (UIFont *)fontRegular:(float)fontSize;
+ (UIFont *)fontHeavy:(float)fontSize;
+ (UIFont *)fontDinBlack:(float)fontSize;
+ (UIFont *)fontDinBold:(float)fontSize;

@end

NS_ASSUME_NONNULL_END
