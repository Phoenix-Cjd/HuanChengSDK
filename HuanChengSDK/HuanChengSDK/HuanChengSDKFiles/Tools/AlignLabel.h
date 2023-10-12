//
//  AlignLabel.h
//  Playhouse
//
//  Created by 杨鹏 on 2023/8/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HGMaker;

typedef NS_ENUM(NSUInteger,textAlignType)
{
    textAlignType_top = 10,   // 顶部对齐
    textAlignType_left,       // 左边对齐
    textAlignType_bottom,     // 底部对齐
    textAlignType_right,      // 右边对齐
    textAlignType_center      // 水平/垂直对齐（默认中心对齐）
};

@interface AlignLabel : UILabel

- (void)textAlign:(void(^)(HGMaker *make))alignType;

@end

@interface HGMaker : NSObject

@property(nonatomic, strong) NSMutableArray *typeArray;
- (HGMaker *(^)(textAlignType type))addAlignType;

@end

NS_ASSUME_NONNULL_END
