//
//  JSMasterViewModel.h
//  QZone
//
//  Created by ShenYj on 16/8/4.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSMasterItem.h"

@interface JSMasterViewModel : NSObject

// 撰写区模型数组
//@property (nonatomic,strong,readonly) NSArray <JSComposeItem *> *composeItems;
// 菜单区模型数组
@property (nonatomic,strong,readonly) NSArray <JSMasterItem *> *menumItems;

@end
