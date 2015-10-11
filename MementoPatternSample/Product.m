//
//  Product.m
//  MementoPatternSample
//
//  Created by lance on 15/10/11.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "Product.h"

@implementation Product

- (id)currentState {
    return @{
             @"name":self.name == nil ? @"" : self.name,
             @"count":self.count == nil ? @(0) : self.count
             };
}

- (void)recoverFromState:(id)state {
    if (state == nil) {
        return;
    }
    NSDictionary * dict = state;
    self.name = dict[@"name"];
    self.count = dict[@"count"];
}

@end
