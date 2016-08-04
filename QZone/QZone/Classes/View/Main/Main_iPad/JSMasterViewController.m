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

static const CGFloat kMenumButtonPortraitHeight = 60;
static const CGFloat kMenumButtonLandScapeHeight = 90;


@interface JSMasterViewController ()

// 主视图容器
@property (weak, nonatomic) UIView *masterContainerView;

// 撰写区StackView
@property (nonatomic,strong) UIStackView *composeArea_StackView;

// 菜单区StackView
@property (nonatomic,strong) UIStackView *menuArea_StackView;


@end

@implementation JSMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置容器视图
    [self prepareContainerView];
    
    // 设置编辑区视图
    [self prepareComposeView];
    
    // 设置菜单区视图
    [self prepareMenuView];
}

// 设置菜单区视图
- (void)prepareMenuView{
    
    // 设置为垂直排列
    self.menuArea_StackView.axis = UILayoutConstraintAxisVertical;
    
    [self.menuArea_StackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.composeArea_StackView.mas_top);
        make.left.right.mas_equalTo(self.view);
    }];
    
    // 添加子视图(UIButton)
    NSArray *composeItems = @[
                              @{@"title":@"全部动态"},
                              @{@"title":@"与我有关"},
                              @{@"title":@"照片墙"},
                              @{@"title":@"电子相框"},
                              @{@"title":@"好友"},
                              @{@"title":@"更多"}
                              ];
    
    for (NSDictionary *dict in composeItems) {
        
        UIButton *button = [[UIButton alloc] init];
        [self.menuArea_StackView addArrangedSubview:button];
        [button setTitle:dict[@"title"] forState:UIControlStateNormal];
        
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(kMenumButtonPortraitHeight);
        }];
    }

}

// 设置编辑区视图
- (void)prepareComposeView{
    
    self.composeArea_StackView.distribution = UIStackViewDistributionFillEqually;
    
    [self.composeArea_StackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(kMenumButtonLandScapeHeight);
    }];
    
    // 添加子视图(UIButton)
    NSArray *composeItems = @[
                              @{@"title":@"说说"},
                              @{@"title":@"照片"},
                              @{@"title":@"日志"}
                              ];
    
    for (NSDictionary *dict in composeItems) {
        
        UIButton *button = [[UIButton alloc] init];
        [self.composeArea_StackView addArrangedSubview:button];
        [button setTitle:dict[@"title"] forState:UIControlStateNormal];

    }
    
    
}

#pragma mark -- 代码实现容器视图:
- (void)prepareContainerView{
    
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
// 根据横竖屏设置子视图布局
- (void)updateSubViewsWithPortrait:(BOOL)portrait{
    
    if (portrait) {
        
        self.composeArea_StackView.axis = UILayoutConstraintAxisVertical;
        // 更新撰写区约束
        [self.composeArea_StackView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.composeArea_StackView.subviews.count * kMenumButtonPortraitHeight);
            make.bottom.mas_equalTo(self.view).mas_offset(-30);
        }];
        
    }else{
        
        self.composeArea_StackView.axis = UILayoutConstraintAxisHorizontal;
        [self.composeArea_StackView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(kMenumButtonLandScapeHeight);
            make.bottom.mas_equalTo(self.view);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -- 懒加载

- (UIStackView *)composeArea_StackView{
    
    if (_composeArea_StackView == nil) {
        _composeArea_StackView = [[UIStackView alloc] init];
        [self.view addSubview:_composeArea_StackView];
    }
    return _composeArea_StackView;
}

- (UIStackView *)menuArea_StackView{
    
    if (_menuArea_StackView == nil) {
        _menuArea_StackView = [[UIStackView alloc] init];
        [self.view addSubview:_menuArea_StackView];
    }
    return _menuArea_StackView;
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
