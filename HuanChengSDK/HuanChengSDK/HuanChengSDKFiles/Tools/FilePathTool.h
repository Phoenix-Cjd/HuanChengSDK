//
//  FilePathTool.h
//  Daleel
//
//  Created by 陈嘉栋 on 2023/3/20.
//

#import <Foundation/Foundation.h>

/**
 文件路径
 */

NS_ASSUME_NONNULL_BEGIN

@interface FilePathTool : NSObject


/// 获取本地路径
/// - Parameter name: 文件夹名称
+ (NSString *)getLocalPathWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
