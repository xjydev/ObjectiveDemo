//
//  EncryptViewController.m
//  ObjectCDemo
//
//  Created by xiaodev on Dec/2/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "EncryptViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
@interface EncryptViewController ()

@end

@implementation EncryptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *encryptStr = @"123456789011223344556677889900";
    NSString *base64EncodeStr = [self encryptBase64WithStr:encryptStr];
    NSLog(@"base64 == %@",[self decryptBase64WithStr:base64EncodeStr]);
    NSLog(@"MD5 == %@",[self encryptMD5WithStr:encryptStr]);
    NSData *aesEncodeData = [self encryptAes256WithStr:encryptStr Key:@"123"];
    NSData *aesDeCodeData = [self decryptAes256WithData:aesEncodeData Key:@"123"];
    NSLog(@"aes == %@",[[NSString alloc]initWithData:aesDeCodeData encoding:NSUTF8StringEncoding]);
    
    NSString *desStr = [self encryptDESWithStr:encryptStr key:@"123"];
    NSLog(@"des == %@",[self decryptDESStr:desStr key:@"123"]);
    
}

/**
 //http://www.jianshu.com/p/b8a5e1c770f9
 //Base64编码本质上是一种将二进制数据转成文本数据的方案。对于非二进制数据，是先将其转换成二进制形式，然后每连续6比特（2的6次方=64）计算其十进制值，根据该值在Base64的编码字符表中找到对应的字符，最终得到一个文本字符串。
 //Base64编码是每3个原始字符编码成4个字符，如果原始字符串长度不能被3整除,使用0值来补充原始字符串。
 //Base64是一种数据编码方式，目的是让数据符合传输协议的要求。标准Base64编码解码无需额外信息即完全可逆

 */
- (NSString *)encryptBase64WithStr:(NSString *)str {
    
    NSData *encryptData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *base64Str = [encryptData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    return base64Str;
   
}
- (NSString *)decryptBase64WithStr:(NSString *)str {
    NSData *base64deData = [[NSData alloc]initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *base64DeStr = [[NSString alloc]initWithData:base64deData encoding:NSUTF8StringEncoding];
   
    return base64DeStr;
}
/**
 MD5加密算法 不管是什么语言得到的结果都是一样的,多数用于验证，比如说密码匹配用的就是MD5加密后得到的数值。
 http://www.cmd5.com/
  */
- (NSString *)encryptMD5WithStr:(NSString *)encryptStr {
    const char *cStr = [encryptStr UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    //把cStr字符串转换成了32位的16进制数列（这个过程不可逆转） 存储到了digest这个空间中
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];//x表示十六进制，%02X  意思是不足两位将用0补齐，如果多余两位则不影响
    return output;
}

/**
 字符串aes加密成二进制

 @param str
 @param key 密码
 @return
 */
- (NSData *)encryptAes256WithStr:(NSString *)str Key:(NSString *)key   //加密
{
    NSData *enData = [str dataUsingEncoding:NSUTF8StringEncoding];
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [enData length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          enData.bytes, dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}


/**
 二进制aes解密成二进制

 @param deData
 @param key 密码
 @return
 */
- (NSData *)decryptAes256WithData:(NSData *)decryptData Key:(NSString *)key   //解密
{
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = decryptData.length;
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          decryptData.bytes, dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        
    }
    free(buffer);
    return nil;
}
//Des加密解密
- (NSString *)encryptDESWithStr:(NSString *)encryptStr key:(NSString *)key
{
    NSString *ciphertext = nil;
    const char *textBytes = [encryptStr UTF8String];
    NSUInteger dataLength = [encryptStr length];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    Byte iv[] = {1,2,3,4,5,6,7,8};
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          textBytes, dataLength,
                                          buffer, 1024,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        
        ciphertext = [[NSString alloc] initWithData:[data base64EncodedDataWithOptions:0] encoding:NSUTF8StringEncoding];
    }
    return ciphertext;
}
- (NSString *)decryptDESStr:(NSString*)decryptStr key:(NSString*)key
{
    NSData* cipherData = [[NSData alloc]initWithBase64EncodedString:decryptStr options:0];
    
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    Byte iv[] = {1,2,3,4,5,6,7,8};
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
