//
//  Product.h
//  MementoPatternSample
//
//  Created by lance on 15/10/11.
//  Copyright © 2015年 lance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MementoPtotocol.h"

@interface Product : NSObject<MementoPtotocol>

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSNumber *count;

@end
