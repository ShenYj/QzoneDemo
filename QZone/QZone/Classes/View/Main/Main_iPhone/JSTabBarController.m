//
//  JSTabBarController.m
//  QZone
//
//  Created by ShenYj on 16/8/3.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSTabBarController.h"
#import "JSTabBar.h"
#import "JSHomeTableViewController.h"
#import "JSAboutMeTableViewController.h"
#import "JSMoreAppTableViewController.h"
#import "JSMySpaceTableViewController.h"
#import "JSComposeViewController.h"


@interface JSTabBarController ()

@end

@implementation JSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置自定义TabBar
    JSTabBar *tabBar = [[JSTabBar alloc] init];
    
    // 自定义TabBar的ComposeButton点击回调Block
    [tabBar setComposeButtonBlock:^{

        JSComposeViewController *composeViewController = [[JSComposeViewController alloc] initWithTitle:@"写说说" completeBlock:nil];
        composeViewController.view.backgroundColor = [UIColor randomColor];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:composeViewController];
        [self presentViewController:navigationController animated:YES completion:nil];
        
        
    }];
    
    [self setValue:tabBar forKey:@"tabBar"];
    
    // 添加子控制器
    [self addChildViewControllers:[[JSHomeTableViewController alloc] init] withImageName:@"tabbar_icon_auth" withTitle:@"动态"];
    [self addChildViewControllers:[[JSAboutMeTableViewController alloc] init] withImageName:@"tabbar_icon_at" withTitle:@"与我相关"];
    [self addChildViewControllers:[[JSMySpaceTableViewController alloc] init] withImageName:@"tabbar_icon_space" withTitle:@"我的"];
    [self addChildViewControllers:[[JSMoreAppTableViewController alloc] init] withImageName:@"tabbar_icon_more" withTitle:@"玩吧"];
    
}

// 添加子控制器&设置子控制器标题和图片
- (void)addChildViewControllers:(UIViewController *)viewController withImageName:(NSString *)imageName withTitle:(NSString *)title{
    
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_click",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.selectedImage = selectedImage;
    
    // 设置tabbarItem字体颜色
    [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor RGBColorWithRed:255 withGreen:205 withBlue:25]} forState:UIControlStateSelected];
    
    [self addChildViewController:viewController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
