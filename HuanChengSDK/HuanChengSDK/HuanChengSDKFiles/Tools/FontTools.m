//
//  FontTools.m
//  Playhouse
//
//  Created by 杨鹏 on 2023/8/9.
//

#import "FontTools.h"

@implementation FontTools

+ (UIFont *)fontWithName:(NSString *)name withFontSize:(float)fontSize {
    return [UIFont fontWithName:name size:fontSize] ?: [UIFont systemFontOfSize:fontSize];
}
+ (UIFont *)fontBold:(float)fontSize {
    return [FontTools fontWithName:@"SanFranciscoDisplay-Bold" withFontSize:fontSize];
}
+ (UIFont *)fontSemibold:(float)fontSize {
    return [FontTools fontWithName:@"SanFranciscoDisplay-Semibold" withFontSize:fontSize];
}
+ (UIFont *)fontMedium:(float)fontSize {
    return [FontTools fontWithName:@"SanFranciscoDisplay-Medium" withFontSize:fontSize];
}
+ (UIFont *)fontRegular:(float)fontSize {
    return [FontTools fontWithName:@"SanFranciscoDisplay-Bold" withFontSize:fontSize];
}
+ (UIFont *)fontHeavy:(float)fontSize {
    return [FontTools fontWithName:@"SanFranciscoDisplay-Heavy" withFontSize:fontSize];
}
+ (UIFont *)fontDinBlack:(float)fontSize {
    return [FontTools fontWithName:@"DIN-BlackItalic" withFontSize:fontSize];
}
+ (UIFont *)fontDinBold:(float)fontSize {
    return [FontTools fontWithName:@"DINCond-Bold" withFontSize:fontSize];
}


@end
