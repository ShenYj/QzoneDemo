//
//  JSMasterViewController.m
//  QZone
//
//  Created by ShenYj on 16/8/3.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSMasterViewController.h"
#import "JSTabBarController.h"
#import "UIColor+RandomColor.h"


@interface JSMasterViewController ()

// 主视图容器
@property (weak, nonatomic) UIView *masterContainerView;

@end

@implementation JSMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark -- 代码实现容器视图:
    
    //容器视图使用场景:内嵌视图控制器
    JSTabBarController *tabBarController = [[JSTabBarController alloc] init];
    tabBarController.view.backgroundColor = [UIColor randomColor];
    
    // 添加内嵌控制器为子控制器  (如果只addSubView不托管控制器,就会导致响应者链条断开,监听不到响应事件)
    // 次控制器的View就相当于容器
    [self addChildViewController:tabBarController];
    // 添加内嵌控制器的视图为子视图 让内嵌的内容显示
    [self.view addSubview:tabBarController.view];
    
    // 设置属性引用 不是代码实现容器视图的必须环节(下面需要使用这个容器视图,设置显隐)
    self.masterContainerView = tabBarController.view;
}

// 根据是否分屏显隐视图
- (void)showContainerView:(BOOL)show{
    
    // 分平时,代表主视图需要显示为iPhone样式,所以主视图上的容器视图显示(隐藏=NO)
    self.masterContainerView.hidden = !show;
    
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
