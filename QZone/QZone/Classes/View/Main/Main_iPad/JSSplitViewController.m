//
//  JSSplitViewController.m
//  QZone
//
//  Created by ShenYj on 16/8/3.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSSplitViewController.h"

@interface JSSplitViewController ()

@end

@implementation JSSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self prepareSplitViewController];
    
}

// 设置SplitViewController
- (void)prepareSplitViewController {
    
    /*
     
     UISplitViewControllerDisplayModeAutomatic,         自动,默认样式
     UISplitViewControllerDisplayModePrimaryHidden,     主视图隐藏   横竖屏主视图都会隐藏,可以通过手势来控制主视图的显隐
     UISplitViewControllerDisplayModeAllVisible,        始终显示     横竖屏主视图都会显示,不可以通过手势来控制主视图的显隐
     UISplitViewControllerDisplayModePrimaryOverlay,    主视图悬停   横竖屏主视图都会显示,可以通过手势来控制主视图的显隐
     
     */
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    
    
    // 监听设备朝向变化
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationDidChangeNotification) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    
}

// 监听设备朝向变化时调用的方法
- (void)orientationDidChangeNotification{
    
    // 设置主视图的宽度比例 (主视图宽度 / SplitVc整体宽度)  比例不好控制&受最大(maximumPrimaryColumnWidth)最小值(minimumPrimaryColumnWidth)约束
    // 直接设置最大宽度为一个固定值
    
    /*
     
     static inline BOOL UIDeviceOrientationIsPortrait(UIDeviceOrientation orientation)  __TVOS_PROHIBITED {
     return ((orientation) == UIDeviceOrientationPortrait || (orientation) == UIDeviceOrientationPortraitUpsideDown);
     }
     
     static inline BOOL UIDeviceOrientationIsLandscape(UIDeviceOrientation orientation)  __TVOS_PROHIBITED {
     return ((orientation) == UIDeviceOrientationLandscapeLeft || (orientation) == UIDeviceOrientationLandscapeRight);
     }
    
    */
    
    // 根据横竖屏变化,设置不同的主视图宽度
    if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)) { // 竖屏
        
        
        self.maximumPrimaryColumnWidth = 60;
        
    }else { // 横向
        
        self.maximumPrimaryColumnWidth = 200;
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
