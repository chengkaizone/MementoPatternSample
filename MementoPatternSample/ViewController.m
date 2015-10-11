//
//  ViewController.m
//  MementoPatternSample
//
//  Created by lance on 15/10/11.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "MementoKit.h"

/**
 *  备忘录模式的简单运用---主要适用于需要持久化对象
 *  本例中使用了FastCoder开源代码实现数据的快速编解码
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Product *duct = [Product new];
    duct.name = @"test";
    duct.count = @(12);
    
    [MementoKit saveMementoObject:duct forKey:@"Product"];

    id state = [MementoKit mementoForKey:@"Product"];
    [duct recoverFromState:state];
    
    
    
    NSLog(@"%@   %@",duct.name, duct.count);
    
}


@end
