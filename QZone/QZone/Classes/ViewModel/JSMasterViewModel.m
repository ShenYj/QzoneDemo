//
//  JSMasterViewModel.m
//  QZone
//
//  Created by ShenYj on 16/8/4.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSMasterViewModel.h"


@implementation JSMasterViewModel

- (NSArray<JSComposeItem *> *)composeItems{
    
    if (_composeItems == nil) {
        
        NSArray *data = @[
                                  @{@"title":@"说说"},
                                  @{@"title":@"照片"},
                                  @{@"title":@"日志"}
                                  ];
        
        NSMutableArray *mArr = [NSMutableArray array];
        
        // 字典转模型
        for (NSDictionary *dict in data) {
            
            JSComposeItem *item = [JSComposeItem itemWithDict:dict];
            [mArr addObject:item];
        }
        
        _composeItems = mArr.copy;
    }
    
    return _composeItems;
}

- (NSArray<JSComposeItem *> *)menumItems{
    
    if (_menumItems == nil) {
        
        NSArray *data = @[
                          @{@"title":@"全部动态"},
                          @{@"title":@"与我有关"},
                          @{@"title":@"照片墙"},
                          @{@"title":@"电子相框"},
                          @{@"title":@"好友"},
                          @{@"title":@"更多"}
                          ];
        
        NSMutableArray *mArr = [NSMutableArray array];
        
        // 字典转模型
        for (NSDictionary *dict in data) {
            
            JSComposeItem *item = [JSComposeItem itemWithDict:dict];
            [mArr addObject:item];
        }
        
        _menumItems = mArr.copy;
    }
    
    return _menumItems;
}

@end
