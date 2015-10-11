//
//  MementoPtotocol.h
//  MementoPatternSample
//
//  Created by lance on 15/10/11.
//  Copyright © 2015年 lance. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MementoPtotocol <NSObject>

@required
/**
 *  将子类化对象处理成能执行序列化的类 NSDictionary
 *
 *  @return
 */
- (id)currentState;

/**
 *  从NSDictionary中恢复成对象属性
 *
 *  @param state
 */
- (void)recoverFromState:(id)state;

@end
