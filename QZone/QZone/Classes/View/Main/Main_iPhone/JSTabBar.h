//
//  JSTabBar.h
//  QZone
//
//  Created by ShenYj on 16/8/3.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSTabBar : UITabBar

// 点击ComposeButton的block
@property (nonatomic,copy) void(^composeButtonBlock)();


@end
