//
//  JSMasterViewController.m
//  QZone
//
//  Created by ShenYj on 16/8/3.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSMasterViewController.h"
#import "JSTabBarController.h"
#import "JSMasterViewModel.h"


static const CGFloat kMenumButtonPortraitHeight = 60;
static const CGFloat kMenumButtonLandScapeHeight = 90;


@interface JSMasterViewController ()

// 主视图容器
@property (weak, nonatomic) UIView *masterContainerView;

// 撰写区StackView
@property (nonatomic,strong) UIStackView *composeArea_StackView;

// 菜单区StackView
@property (nonatomic,strong) UIStackView *menuArea_StackView;

// 主视图模型
@property (nonatomic,strong) JSMasterViewModel *masterViewModel;


@end



@implementation JSMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置容器视图
    [self prepareContainerView];
    
    // 设置菜单区视图
    [self prepareMenuView];
}

// 设置菜单区视图
- (void)prepareMenuView{
    
    // 添加子视图(UIButton)
    for (JSMasterItem *item in self.masterViewModel.menumItems) {
        
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:item.title forState:UIControlStateNormal];
        
        if (item.isComposeArea) {
            // 撰写区
            
            [self.composeArea_StackView addArrangedSubview:button];
            
        }else{
            // 菜单区
            [self.menuArea_StackView addArrangedSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(kMenumButtonPortraitHeight);
            }];
        }
        
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
        
        self.composeArea_StackView.distribution = UIStackViewDistributionFillEqually;
        
        [self.composeArea_StackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(self.view);
            make.height.mas_equalTo(kMenumButtonLandScapeHeight);
        }];
        
    }
    return _composeArea_StackView;
}

- (UIStackView *)menuArea_StackView{
    
    if (_menuArea_StackView == nil) {
        _menuArea_StackView = [[UIStackView alloc] init];
        [self.view addSubview:_menuArea_StackView];
        // 设置为垂直排列
        self.menuArea_StackView.axis = UILayoutConstraintAxisVertical;
        
        [self.menuArea_StackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.composeArea_StackView.mas_top);
            make.left.right.mas_equalTo(self.view);
        }];
    }
    
    
    return _menuArea_StackView;
}

- (JSMasterViewModel *)masterViewModel{
    
    if (_masterViewModel == nil) {
        _masterViewModel = [[JSMasterViewModel alloc] init];
    }
    return _masterViewModel;
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
