//
//  AlignLabel.m
//  Playhouse
//
//  Created by 杨鹏 on 2023/8/10.
//

#import "AlignLabel.h"

@interface AlignLabel ()

@property(nonatomic, strong) NSArray * typeArray;
@property(nonatomic, assign) BOOL hasTop;
@property(nonatomic, assign) BOOL hasLeft;
@property(nonatomic, assign) BOOL hasBottom;
@property(nonatomic, assign) BOOL hasRight;

@end

@implementation AlignLabel

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    if (self.typeArray){
        for (int i=0; i<self.typeArray.count; i++) {
            textAlignType type = [self.typeArray[i] integerValue];
            switch (type) {
                case textAlignType_top:  //顶部对齐
                    self.hasTop = YES;
                    textRect.origin.y = bounds.origin.y;
                    break;
                case textAlignType_left: //左部对齐
                    self.hasLeft = YES;
                    textRect.origin.x = bounds.origin.x;
                    break;
                case textAlignType_bottom: //底部对齐
                    self.hasBottom = YES;
                    textRect.origin.y = bounds.size.height - textRect.size.height;
                    break;
                case textAlignType_right: //右部对齐
                    self.hasRight = YES;
                    textRect.origin.x = bounds.size.width - textRect.size.width;
                    break;
                case textAlignType_center:
                    if (self.hasTop) {  //上中
                        textRect.origin.x = (bounds.size.width - textRect.size.width)*0.5;
                    }
                    else if (self.hasLeft) { //左中
                        textRect.origin.y = (bounds.size.height - textRect.size.height)*0.5;
                    }
                    else if (self.hasBottom) { //下中
                        textRect.origin.x = (bounds.size.width - textRect.size.width)*0.5;
                    }
                    else if (self.hasRight) { //右中
                        textRect.origin.y = (bounds.size.height - textRect.size.height)*0.5;
                    }
                    else{   //上下左右居中
                        textRect.origin.x = (bounds.size.width - textRect.size.width)*0.5;
                        textRect.origin.y = (bounds.size.height - textRect.size.height)*0.5;
                    }
                    break;
                default:
                    break;
            }
        }
    }
    return textRect;
}

- (void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = requestedRect;
    if (self.typeArray) {
        actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    }
    [super drawTextInRect:actualRect];
}

- (void)textAlign:(void(^)(HGMaker *make))alignType {
    HGMaker *make = [[HGMaker alloc]init];
    alignType(make);
    self.typeArray = make.typeArray;
}

@end

@implementation HGMaker

- (instancetype)init {
    self = [super init];
    if (self) {
        self.typeArray = [NSMutableArray array];
    }
    return self;
}

- (HGMaker *(^)(enum textAlignType type))addAlignType {
    __weak typeof (self) weakSelf = self;
    return ^(enum textAlignType type)
    {
        [weakSelf.typeArray addObject:@(type)];
        return weakSelf;
    };
}



@end
