//
//  UITextView+Extension.m
//  Gamfun
//
//  Created by 杨鹏 on 2022/7/20.
//

#import "UITextView+Extension.h"

static char limitCountKey;
static char isLimitCharKey;
static char labMarginKey;
static char labHeightKey;
static char hasLimitLabelKey;

@implementation UITextView (Extension)

+ (void)load {
    Method setFontMethod = class_getInstanceMethod(self, @selector(setFont:));
    Method was_setFontMethod = class_getInstanceMethod(self, @selector(was_setFont:));
    method_exchangeImplementations(setFontMethod, was_setFontMethod);
}

- (void)setPlaceholderWithText:(NSString *)text Color:(UIColor *)color{
    //多余 强指针换了指向以后label自动销毁
    //防止重复设置 cell复用等问题
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            [view removeFromSuperview];
        }
    }
    
    //设置占位label
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = self.font;
    label.textColor = color;
    label.numberOfLines = 0;
    [label sizeToFit];
    
    [self addSubview:label];
    [self setValue:label forKey:@"_placeholderLabel"];
}

- (void)was_setFont:(UIFont *)font{
    [self was_setFont:font];
    UILabel *label = [self valueForKey:@"_placeholderLabel"];
    label.font = font;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
