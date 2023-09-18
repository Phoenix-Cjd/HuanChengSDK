//
//  ToastTool.m
//  Daleel
//
//  Created by mac on 2022/11/29.
//

#import "ToastTool.h"

@implementation ToastTool

+ (void)showToast:(NSString *)str {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.label.numberOfLines = 0;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = str;
    hud.label.textColor = [UIColor whiteColor];
    hud.label.font = [UIFont systemFontOfSize:14];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:0.8];
    [hud hideAnimated:YES afterDelay:2.5f];
}

@end
