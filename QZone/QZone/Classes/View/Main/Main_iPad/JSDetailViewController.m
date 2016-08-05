//
//  JSDetailViewController.m
//  QZone
//
//  Created by ShenYj on 16/8/5.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSDetailViewController.h"
#import "JSMasterItem.h"

@interface JSDetailViewController ()

// 容器视图
@property (nonatomic,strong) UINavigationController *containerView_NavigationView;

@end

@implementation JSDetailViewController{
    
    JSMasterItem *_masterItem;
}


- (instancetype)initWithMasterItem:(JSMasterItem *)item{
    
    self = [super init];
    if (self) {
        _masterItem = item;
        
        // 遮挡分割线
        [self prepareMaskView];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置容器视图
    [self prepareContainerView];
    
    [self.containerView_NavigationView.view mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.right.mas_equalTo(self.view).mas_offset(-40);
        //        make.top.mas_equalTo(self.view).mas_offset(20);
        // 这里直接设置上左下右是无效的,需要设置内边距
        make.edges.mas_equalTo(UIEdgeInsetsMake(20, 0, 0, 40));
    }];
}

// 设置容器视图
- (void)prepareContainerView{
    
    // 获取控制器类名
    NSString *className = _masterItem.controllerClassName;
    // 使用运行时机制将类名转为类
    Class class = NSClassFromString(className);
    
    // 导航控制器的根控制器
    UIViewController *viewController = [[class alloc] init];
    
    // 设置导航控制器的根控制器
    [self prepareNavigationRootViewController:viewController];
    
    // 创建导航控制器
    self.containerView_NavigationView =[[UINavigationController alloc] initWithRootViewController:viewController];
    // 添加子控制器
    [self addChildViewController:_containerView_NavigationView];
    // 添加子视图
    [self.view addSubview:_containerView_NavigationView.view];
    
}

// 设置导航控制器的根控制器视图
- (void)prepareNavigationRootViewController:(UIViewController *)rooViewController{
    
    //    rooViewController.title = _masterItem.title;等同于下面的设置
    rooViewController.navigationItem.title = _masterItem.title;
    
    if (_masterItem.segmetnItem) {
        
        // 设置分段控件
        UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:_masterItem.segmetnItem];
        
        rooViewController.navigationItem.titleView = segment;
        
        // 分段控件颜色
        segment.tintColor = kbackgroundColor;
    }
    
    
}

// 遮挡分割线
- (void)prepareMaskView{
    
    UIView *maskView = [[UIView alloc ] init];
    maskView.backgroundColor = kbackgroundColor;
    [self.view insertSubview:maskView atIndex:0];
//    [self.view addSubview:maskView];
    [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, -2, 0, 0));
    }];
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
