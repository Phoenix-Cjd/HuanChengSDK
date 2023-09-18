//
//  UIView+Extension.h
//  Gamfun
//
//  Created by 杨鹏 on 2022/6/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extension)<UIGestureRecognizerDelegate>

@property (nonatomic,copy) void (^clickBlock)(void);

/// 初始化View
/// @param superView 父视图
+ (instancetype)viewWithSuperView:(UIView *)superView;
- (void)addTapAction:(void (^)(void))clickBlock;
- (void)addScaleAnimation;
- (void)addCornerPath:(CGFloat)radius;
- (void)addTopCornerPath:(CGFloat)radius;
- (void)addBottomCornerPath:(CGFloat)radius;
- (void)addCircleCornerPath;
- (void)addLeftCornerPath:(CGFloat)radius;
- (void)addRightCornerPath:(CGFloat)radius;

/// 绘制倒角 （自由设置角角）
/// @param cornerRadius  圆角大小
/// @param size 所设置圆角view的大小
/// @param corner 圆角方向
- (void)drawCornerRadius:(CGFloat)cornerRadius withSize:(CGSize)size cornerType:(UIRectCorner)corner;

- (CGFloat)x;
- (CGFloat)y;
- (CGFloat)width;
- (CGFloat)height;

- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;

@property (nonatomic, assign) CGFloat changeWidth;
@property (nonatomic, assign) CGFloat changeHeight;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGSize size;
@property CGPoint origin;
@property CGFloat height;
@property CGFloat width;
@property CGFloat top;
@property CGFloat left;
@property CGFloat bottom;
@property CGFloat right;

@property (nonatomic, assign, readonly, getter=getMinY) CGFloat minY;

@property (nonatomic, assign, readonly, getter=getMidY) CGFloat midY;

@property (nonatomic, assign, readonly, getter=getMaxY) CGFloat maxY;

@property (nonatomic, assign, readonly, getter=getMinX) CGFloat minX;

@property (nonatomic, assign, readonly, getter=getMidX) CGFloat midX;

@property (nonatomic, assign, readonly, getter=getMaxX) CGFloat maxX;

@end

NS_ASSUME_NONNULL_END
