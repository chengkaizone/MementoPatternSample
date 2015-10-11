//
//  MementoKit.h
//  MementoPatternSample
//
//  Created by lance on 15/10/11.
//  Copyright © 2015年 lance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MementoPtotocol.h"

@interface MementoKit : NSObject

/**
 *  持久化对象状态
 *
 *  @param obj 需要持久化的对象
 *  @param key 提取的键值
 */
+ (void)saveMementoObject:(id<MementoPtotocol>)obj forKey:(NSString *)key;

/**
 *  获取持久化的对象
 *
 *  @param key 保存时的键值
 *
 *  @return
 */
+ (id)mementoForKey:(NSString *)key;

@end
