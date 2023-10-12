//
//  InshortTF.m
//  Playhouse
//
//  Created by 杨鹏 on 2023/8/10.
//

#import "InshortTF.h"

@implementation InshortTF

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    NSTextAlignment alignment = NSTextAlignmentLeft;
    if (textAlignment == NSTextAlignmentLeft || NSTextAlignmentNatural) {
        alignment = [LanguageTool isArabic] ? NSTextAlignmentRight : NSTextAlignmentLeft;
    }
    if (textAlignment == NSTextAlignmentRight) {
        alignment = [LanguageTool isArabic] ? NSTextAlignmentLeft : NSTextAlignmentRight;
    }
    [super setTextAlignment:alignment];
}

- (void)drawPlaceholderInRect:(CGRect)rect {
    CGSize placeS = [self.placeholder sizeWithAttributes:@{NSFontAttributeName:self.font}];
    [self.placeholder drawInRect:CGRectMake(0, (rect.size.height - placeS.height)/2, rect.size.width, rect.size.height) withAttributes:@{NSForegroundColorAttributeName:RGB(0xB5B5B5),NSFontAttributeName:self.font}];
}

// 控制文本的边距
- (CGRect)textRectForBounds:(CGRect)bounds {
    if (self.padding > 0) {
        return CGRectInset(bounds, self.padding, 0);
    }
    return bounds;
}
 
// 控制 placeHolder 的边距
- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    if (self.padding > 0) {
        return CGRectInset(bounds, self.padding, 0);
    }
    return bounds;
}
 
// 控制编辑状态文本的边距
- (CGRect)editingRectForBounds:(CGRect)bounds {
    if (self.padding > 0) {
        return CGRectInset(bounds, self.padding, 0);
    }
    return bounds;
}

@end
