//
//  JSMasterViewModel.m
//  QZone
//
//  Created by ShenYj on 16/8/4.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSMasterViewModel.h"

// 因为加了readOnly修饰,同时重写了getter方法,不会自动生成带下划线的成员变量,所以需要人工合成
@implementation JSMasterViewModel{
    
    NSArray <JSMasterItem *> *_menumItems;
    
    // 第一种方式
    // NSArray <JSComposeItem *> *_composeItems;
    
}
// 第二种方式
//@synthesize composeItems = _composeItems;
//@synthesize menumItems = _menumItems;


- (NSArray<JSMasterItem *> *)menumItems{
    
    if (_menumItems == nil) {
        
        NSArray *data = @[
                          @{ @"title":@"全部动态", @"imageName":@""},
                          @{ @"title":@"与我有关", @"imageName":@""},
                          @{ @"title":@"照片墙", @"imageName":@""},
                          @{ @"title":@"电子相框", @"imageName":@""},
                          @{ @"title":@"好友", @"imageName":@""},
                          @{ @"title":@"更多", @"imageName":@""},
                          @{ @"title":@"说说", @"imageName":@"", @"composeArea":@YES },
                          @{ @"title":@"照片", @"imageName":@"", @"composeArea":@YES },
                          @{ @"title":@"日志", @"imageName":@"", @"composeArea":@YES }
                          ];
        
        NSMutableArray *mArr = [NSMutableArray array];
        
        // 字典转模型
        for (NSDictionary *dict in data) {
            
            JSMasterItem *item = [JSMasterItem itemWithDict:dict];
            [mArr addObject:item];
        }
        
        _menumItems = mArr.copy;
    }
    
    return _menumItems;
}






//- (NSArray<JSComposeItem *> *)composeItems{
//
//    if (_composeItems == nil) {
//
//        NSArray *data = @[
//                          @{ @"title":@"说说", @"imageName":@"", @"composeArea":@YES },
//                          @{ @"title":@"照片", @"imageName":@"", @"composeArea":@YES },
//                          @{ @"title":@"日志", @"imageName":@"", @"composeArea":@YES }
//                          ];
//
//        NSMutableArray *mArr = [NSMutableArray array];
//
//        // 字典转模型
//        for (NSDictionary *dict in data) {
//
//            JSComposeItem *item = [JSComposeItem itemWithDict:dict];
//            [mArr addObject:item];
//        }
//
//        _composeItems = mArr.copy;
//    }
//
//    return _composeItems;
//}

@end
