//
//  JSSplitViewController.m
//  QZone
//
//  Created by ShenYj on 16/8/3.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSSplitViewController.h"
#import "JSMasterViewController.h"
#import "UIColor+RandomColor.h"


@interface JSSplitViewController ()



@end

@implementation JSSplitViewController

- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        // 创建splitViewController 在显示前必须设置主视图控制器,可以不设置明细控制器
        // SplitViewController可以通过addChildViewController添加子控制器,但是只有添加的第一个子控制器会被设置在主视图控制器的位置上,第二个控制器会被设置在明细视图控制器的位置上
        // 允许继续添加,但是不会被显示
        
        // 设置主视图
        JSMasterViewController *masterViewController = [[JSMasterViewController alloc] init];
        masterViewController.view.backgroundColor = [UIColor randomColor];
        [self addChildViewController:masterViewController];
        
        // 设置详情视图
        UIViewController *detailViewController = [[UIViewController alloc] init];
        detailViewController.view.backgroundColor = [UIColor randomColor];
        [self addChildViewController:detailViewController];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置SplitViewController
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
    if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)) {
        // 竖屏
        self.maximumPrimaryColumnWidth = 60;
    }else {
        // 横向
        self.maximumPrimaryColumnWidth = 200;
    }
    
}

#pragma mark -- UITraitEnvironment

// 当SizeClass发生变化后调用
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    
    // 判断当前的SizeClass,如果为width compact&height regular 则说明正在分屏
    BOOL isTrait = (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact) && (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular);
    
    // 获取SplitViewController的主视图控制器
    JSMasterViewController *masterViewController = self.viewControllers[0];
    
    if (isTrait) {
        // 正在分屏
        NSLog(@"正在分屏");
        [masterViewController showContainerView:isTrait];
        
    }else {
        
        NSLog(@"没有分屏");
        [masterViewController showContainerView:isTrait];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
