//
//  JSDetailViewController.m
//  QZone
//
//  Created by ShenYj on 16/8/5.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSDetailViewController.h"
#import "JSMasterButton.h"

@interface JSDetailViewController ()

// 容器视图
@property (nonatomic,strong) UINavigationController *containerView_NavigationView;

@end

@implementation JSDetailViewController{
    
    JSMasterButton *_masterButton;
}


- (instancetype)initWithMasterButton:(JSMasterButton *)button{
    
    self = [super init];
    if (self) {
        _masterButton = button;
        
        [self prepareMaskView];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.containerView_NavigationView.view.backgroundColor = [UIColor randomColor];
    [self.containerView_NavigationView.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(self.view).mas_offset(-40);
//        make.top.mas_equalTo(self.view).mas_offset(20);
        // 这里直接设置上左下右是无效的,需要设置内边距
        make.edges.mas_equalTo(UIEdgeInsetsMake(20, 0, 0, 40));
    }];
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

- (UINavigationController *)containerView_NavigationView{
    
    if (_containerView_NavigationView == nil) {
        
        UIViewController *viewController = [[UIViewController alloc] init];
        _containerView_NavigationView = [[UINavigationController alloc] initWithRootViewController:viewController];
        // 添加子控制器
        [self addChildViewController:_containerView_NavigationView];
        // 添加子视图
        [self.view addSubview:_containerView_NavigationView.view];
    }
    return _containerView_NavigationView;
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
