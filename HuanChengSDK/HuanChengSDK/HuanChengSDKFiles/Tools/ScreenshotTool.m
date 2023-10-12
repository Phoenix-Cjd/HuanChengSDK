//
//  ScreenshotTool.m
//  Gamfun
//
//  Created by mac on 2022/10/10.
//

#import "ScreenshotTool.h"

@implementation ComImgModel

@end

@implementation ScreenshotTool

+(UIImage *)screenshotScrollView:(UIScrollView *)scrollview withScale:(float)scale {
    UIImage *image = nil;
    
    CGPoint savedContentOffset = scrollview.contentOffset;
    CGRect savedFrame = scrollview.frame;
    
    scrollview.contentOffset = CGPointZero;
    scrollview.frame = CGRectMake(0, 0, scrollview.frame.size.width, scrollview.contentSize.height);
    
    image = [self screenshotView:scrollview scale:scale];
    
    scrollview.contentOffset = savedContentOffset;
    scrollview.frame = savedFrame;
    
    return image;
}

+(UIImage *)screenshotView:(UIView *)view scale:(float)scale {
    UIImage *image = nil;
    
    CGSize imageSize = CGSizeMake(view.frame.size.width, view.frame.size.height);
    
    imageSize = CGSizeApplyAffineTransform(imageSize, CGAffineTransformMakeScale(scale, scale));
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(context, scale, scale);
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    if (image) {
//        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
        return image;
    }
    NSLog(@"ScreenshotTool : 截图失败");
    return nil;
}

+(UIImage *)compositeImgWithSize:(CGSize)size withImgs:(NSArray <ComImgModel *> *) imgs {
    UIGraphicsBeginImageContext(size);
    
    for (ComImgModel *imgModel in imgs) {
        if (imgModel.img == nil) {
            NSLog(@"ScreenshotTool :合成图片时候存在空图片,已经跳过了");
        }
        [imgModel.img drawInRect:imgModel.imgRect];
    }
    
    UIImage *comImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (comImg) {
//        UIImageWriteToSavedPhotosAlbum(comImg, self, nil, nil);
        return comImg;
    }
    NSLog(@"ScreenshotTool : 合成图片图片失败");
    return nil;
    
    return comImg;
}

@end
