//
//  UIImage+Extension.m
//  Gamfun
//
//  Created by 杨鹏 on 2022/9/30.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

- (UIImage *)yp_imageFlippedForRightToLeftLayoutDirection {
    if ([LanguageTool isArabic]) {
        return [UIImage imageWithCGImage:self.CGImage scale:self.scale orientation:UIImageOrientationUpMirrored];
    }
    return self;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
