//
//  JSComposeItem.m
//  QZone
//
//  Created by ShenYj on 16/8/4.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSMasterItem.h"

@implementation JSMasterItem

+ (instancetype)itemWithDict:(NSDictionary *)dict{
    
    // 创建模型对象
    JSMasterItem *item = [[self alloc] init];
    // KVC
    [item setValuesForKeysWithDictionary:dict];
    
    return item;
}

@end
