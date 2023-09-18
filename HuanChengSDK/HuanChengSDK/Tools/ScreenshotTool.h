//
//  ScreenshotTool.h
//  Gamfun
//
//  Created by mac on 2022/10/10.
//

/**
 截图工具（功能：view scrollview 以及 多图片合成）
 */

#import <Foundation/Foundation.h>

@interface ComImgModel : NSObject

@property (nonatomic,strong) UIImage *img;
@property (nonatomic,assign) CGRect imgRect;

@end

@interface ScreenshotTool : NSObject

/// 截图 - view
/// @param view 要截图的view
/// @param scale 放大参数（放大不会损失精度 没有特殊要求 1.0 就OK）
+(UIImage *)screenshotView:(UIView *)view scale:(float)scale;

/// 截图 - scrollview
/// @param scrollview 要截图的scrollview
/// @param scale 放大参数（放大不会损失精度 没有特殊要求 1.0 就OK）
+(UIImage *)screenshotScrollView:(UIScrollView *)scrollview withScale:(float)scale;


/// 多图片合成
/// @param size 要合成图片的大小
/// @param imgs 合成图片数组 （ComImgModel 图片 以及要合成图片的rect）
+(UIImage *)compositeImgWithSize:(CGSize)size withImgs:(NSArray <ComImgModel *> *) imgs;

@end

