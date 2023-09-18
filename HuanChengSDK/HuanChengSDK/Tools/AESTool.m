//
//  AESTool.m
//  Gamfun
//
//  Created by 杨鹏 on 2022/7/11.
//

#import "AESTool.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

const NSString *aesKey = @"toSsQu7If3z93Ie89igOKtFCmK4FeijW";
const NSString *aesIv = @"6WWlLT5rNQPbKDr8";

@implementation AESTool

/// AES 加密
+ (NSString *)aesEncrypt:(NSString *)sourceStr {
    char keyPtr[kCCKeySizeAES256 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [aesKey getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSData *data = [sourceStr dataUsingEncoding:NSUTF8StringEncoding];
    const void *bytesOfData = data.bytes;
    NSUInteger lengthOfData = data.length;
    
    size_t bufferSize = lengthOfData + kCCBlockSizeAES128;
    unsigned char *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES,
                                          kCCOptionECBMode | kCCOptionPKCS7Padding,
                                          keyPtr,
                                          32,
                                          NULL,
                                          bytesOfData,
                                          lengthOfData,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        return [resultData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    
    free(buffer);
    
    return @"";
}

/// AES 解密
+ (NSDictionary *)aesDecrypt:(NSString *)secreStr {
    if (secreStr.length == 0) {
        return nil;
    }
    char keyPtr[kCCKeySizeAES256 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [aesKey getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:secreStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    const void *bytesOfData = data.bytes;
    NSUInteger lengthOfData = data.length;
     
    size_t bufferSize = lengthOfData + kCCBlockSizeAES128;
    unsigned char *buffer = malloc(bufferSize);
    
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES,
                                          kCCOptionECBMode | kCCOptionPKCS7Padding,
                                          keyPtr,
                                          32,
                                          NULL,
                                          bytesOfData,
                                          lengthOfData,
                                          buffer,
                                          bufferSize,
                                          &numBytesCrypted);
    
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
        NSString *jsonStr = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
        NSDictionary *dic = [NSString convertToObject:jsonStr];
        return dic;
    }
    
    free(buffer);
    
    return nil;
}

+ (NSString *)MD5EncryptUpper:(NSString *)sourceStr {
    const char *cStr = [sourceStr UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] uppercaseString];
}

@end
