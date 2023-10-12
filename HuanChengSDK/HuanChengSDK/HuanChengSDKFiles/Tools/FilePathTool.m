//
//  FilePathTool.m
//  Daleel
//
//  Created by 陈嘉栋 on 2023/3/20.
//

#import "FilePathTool.h"

@implementation FilePathTool
+ (NSString *)getLocalPathWithName:(NSString *)name {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    docDir = [docDir stringByAppendingFormat:@"/%@/",name];
    if (![[NSFileManager defaultManager] fileExistsAtPath:docDir]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:docDir withIntermediateDirectories:NO attributes:nil error:nil];
    }
    return docDir;
}
@end
