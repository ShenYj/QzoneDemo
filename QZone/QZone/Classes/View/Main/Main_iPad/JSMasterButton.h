//
//  JSMasterButton.h
//  QZone
//
//  Created by ShenYj on 16/8/4.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JSMasterItem;
@interface JSMasterButton : UIButton

// 模型对象
@property (nonatomic,strong) JSMasterItem *item;

// 类方法创建
+ (instancetype)buttonWithItem:(JSMasterItem *)item;
// 对象方法
- (instancetype)initWithItem:(JSMasterItem *)item;
// 根据横竖屏情况设置菜单区视图布局
- (void)prepareContentEdgeWithPortrait:(BOOL)portrait;

@end
