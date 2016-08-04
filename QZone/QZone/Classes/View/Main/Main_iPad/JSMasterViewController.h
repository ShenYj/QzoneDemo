//
//  JSMasterViewController.h
//  QZone
//
//  Created by ShenYj on 16/8/3.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSMasterViewController : UIViewController

// 根据横竖屏情况,设置子视图的布局
- (void)updateSubViewsWithPortrait:(BOOL)portrait;

// 根据是否分屏显隐视图
- (void)showContainerView:(BOOL)show;

@end
