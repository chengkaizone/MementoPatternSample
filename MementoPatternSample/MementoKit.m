//
//  MementoKit.m
//  MementoPatternSample
//
//  Created by lance on 15/10/11.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "MementoKit.h"
#import "FastCoder.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MementoKit

+ (void)saveMementoObject:(id<MementoPtotocol>)obj forKey:(NSString *)key {
    if (obj == nil || key == nil) {
        return;
    }
    
    NSData *data = [self makeDataWithValue:[obj currentState]];
    if (data) {
        [self saveValue:data forKey:[self MD5HashWithString:key]];
    }
    
}

+ (id)mementoForKey:(NSString *)key {
    if(key == nil) {
        return nil;
    }
    
    NSData *data = [self valueForKey:[self MD5HashWithString:key]];
    if (data) {
        return [self makeObjectWithData:data];
    }
    
    return nil;
}

#pragma mark - md5
+ (NSString *)MD5HashWithString:(NSString *)string {
    
    CC_MD5_CTX md5;
    
    CC_MD5_Init(&md5);
    CC_MD5_Update(&md5, [string UTF8String], (CC_LONG) [string length]);
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    
    NSString *s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                   digest[0],  digest[1],
                   digest[2],  digest[3],
                   digest[4],  digest[5],
                   digest[6],  digest[7],
                   digest[8],  digest[9],
                   digest[10], digest[11],
                   digest[12], digest[13],
                   digest[14], digest[15]];
    
    return s;
}

/**
 *  本例中使用简单存储进行保存,
 *  实际使用时宜采用归档的方式持久化
 *  @param value
 *  @param key
 */
+ (void)saveValue:(id)value forKey:(NSString *)key {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:value forKey:key];
    [userDefault synchronize];
}

+ (id)valueForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}


#pragma mark FastCoder
+ (NSData *)makeDataWithValue:(id)value {
    return [FastCoder dataWithRootObject:value];
}

+ (id)makeObjectWithData:(NSData *)data {
    return [FastCoder objectWithData:data];
}

@end
