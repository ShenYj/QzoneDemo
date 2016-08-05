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
#import "JSMasterButton.h"
#import "JSDetailViewController.h"


@interface JSMasterViewController ()

// 主视图容器
@property (weak, nonatomic) UIView *masterContainerView;

// 撰写区StackView
@property (nonatomic,strong) UIStackView *composeArea_StackView;

// 菜单区StackView
@property (nonatomic,strong) UIStackView *menuArea_StackView;

// 主视图模型
@property (nonatomic,strong) JSMasterViewModel *masterViewModel;

// 头像按钮
@property (nonatomic,strong) UIButton *iconButton;
// 名称Label
@property (nonatomic,strong) UILabel *nameLabel;

// 记录选中按钮
@property (nonatomic,strong) JSMasterButton *selectedButton;

@end



@implementation JSMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置菜单区视图
    [self prepareMenuView];
    // 设置容器视图
    [self prepareContainerView];
    // 设置头像视图
    [self prepareIconButton];
    // 设置昵称Label
    [self prepareNameLabel];
}

// 设置头像视图
- (void)prepareIconButton{
    
    // 设置头像图片
    [self.iconButton setImage:[UIImage imageNamed:@"default_person_lit"] forState:UIControlStateNormal];
    
    // 设置约束
    
    // button有固有尺寸,使用autolayout时,如果没有设置宽高,就会使用默认的系统设置进行宽高的设置:
    // 隐式调用sizeToFit方法,该方法会根据原始尺寸进行设置
    [self.iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(20);
        // 设置左侧间距  利用水平居中的特性在竖屏时对头像视图进行压缩
        // 大于等于边距  既可以保证右侧间距也大于等于5(竖屏时会进行压缩),同时对横向宽度并不是具体值,这样autolayout就会根据固有尺寸设置button的宽高
        make.left.mas_greaterThanOrEqualTo(5);
        // 水平间距
        make.centerX.mas_equalTo(self.view);
        // 高度=宽度
        make.height.mas_equalTo(self.iconButton.mas_width);
    }];
    
}

// 设置昵称Label
- (void)prepareNameLabel{
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconButton.mas_bottom).mas_offset(30);
        make.centerX.mas_equalTo(self.view);
    }];
    
}

// 设置菜单区视图
- (void)prepareMenuView{
    
    // 添加子视图(UIButton)
    for (JSMasterItem *item in self.masterViewModel.menumItems) {
        
        JSMasterButton *button = [[JSMasterButton alloc] initWithItem:item];

        
        if (item.isComposeArea) {
            
            // 撰写区
            [self.composeArea_StackView addArrangedSubview:button];
            
        }else{
            
            // 菜单区
            [self.menuArea_StackView addArrangedSubview:button];

        }
        // 设置事件监听
        [button addTarget:self action:@selector(clickMasterButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    // 设置背景色
    self.view.backgroundColor = kbackgroundColor;
    
    // 设置默认选中按钮
    JSMasterButton *button = self.menuArea_StackView.subviews[0];
    [self clickMasterButton:button];

}

#pragma mark -- 事件响应

// 点击主视图按钮
- (void)clickMasterButton:(JSMasterButton *)sender{
    
    if (self.selectedButton == sender) {
        return;
    }
    
    self.selectedButton.selected = NO;
    sender.selected = YES;
    self.selectedButton = sender;
    
    
    JSDetailViewController *detailViewController = [[JSDetailViewController alloc] initWithMasterItem:sender.item];
    detailViewController.view.backgroundColor = kbackgroundColor;
    [self.splitViewController showDetailViewController:detailViewController sender:self];

    
    
    
    // 切换明细视图控制器
    /*
        参数1: 新的明细控制器 (如果已经存在明细控制器,且原来的明细控制器没有其他强引用,则切换新明细控制器后,圆明细控制器由于没有强引用会被释放
        参数2: 事件响应的发起者 (控制器) ,事件响应者链条监听中需要根据这个参数判断是哪个控制器 ; 当前在主视图控制器下,所以传入self ,但这里并不会使用到,也可以传入nil
     */
    
//    UIViewController *detail = [[UIViewController alloc] init];
//    detail.view.backgroundColor = [UIColor randomColor];
//    [self.splitViewController showDetailViewController:detail sender:self];
    /*
            切换主视图控制器或明细控制器
           具体切换哪个位置上的控制器由sender来确定:
        如果sender为当前的主视图控制器,则切换到主视图控制器的位置上
        如果sender为明细视图控制器,则切换到明细视图控制器的位置上
//     */
//    UIViewController *master = [[UIViewController alloc] init];
//    [self.splitViewController showViewController:master sender:self];
    // 切换明细视图控制器
//    [self.splitViewController showViewController:detail sender:self.splitViewController.viewControllers[1]];
    
    
    
    
}


#pragma mark -- 代码实现容器视图:
- (void)prepareContainerView{
    
    //容器视图使用场景:内嵌视图控制器
    JSTabBarController *tabBarController = [[JSTabBarController alloc] init];
    tabBarController.view.backgroundColor = [UIColor randomColor];
    
    // 添加内嵌控制器为子控制器  (如果只addSubView不托管控制器,就会导致响应者链条断开,监听不到响应事件)
    // 此控制器的View就相当于容器
    [self addChildViewController:tabBarController];
    // 添加内嵌控制器的视图为子视图 让内嵌的内容显示
    [self.view addSubview:tabBarController.view];
    
    // 设置属性引用 不是代码实现容器视图的必须环节(下面需要使用这个容器视图,设置显隐)
    self.masterContainerView = tabBarController.view;
    
}

// 根据是否分屏显隐视图
- (void)showContainerView:(BOOL)show{
    
    // 分平时,代表主视图需要显示为iPhone样式,所以主视图上的容器视图显示( 隐藏=NO )
    self.masterContainerView.hidden = !show;
    
}

// 根据横竖屏设置子视图布局
- (void)updateSubViewsWithPortrait:(BOOL)portrait{
    
    if (portrait) {
        // 竖屏
        self.composeArea_StackView.axis = UILayoutConstraintAxisVertical;
        // 更新撰写区约束
        [self.composeArea_StackView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.composeArea_StackView.subviews.count * kMenumButtonPortraitHeight);
            make.bottom.mas_equalTo(self.view).mas_offset(-30);
        }];
        
        // 设置昵称
        self.nameLabel.text = @"";
        
    }else{
        // 横屏
        self.composeArea_StackView.axis = UILayoutConstraintAxisHorizontal;
        [self.composeArea_StackView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(kMenumButtonLandScapeHeight);
            make.bottom.mas_equalTo(self.view);
        }];
        
        // 设置昵称
        self.nameLabel.text = @"一只耳";
    }
    
    // 取出所有的菜单区按钮,将横竖屏情况传递给按钮
    for (JSMasterButton *button in self.menuArea_StackView.subviews) {
        
        // 将横竖屏传递给JSButton
        [button prepareContentEdgeWithPortrait:portrait];
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

- (UIButton *)iconButton{
    
    if (_iconButton == nil) {
        _iconButton = [[UIButton alloc] init];
        [self.view addSubview:_iconButton];
    }
    return _iconButton;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:_nameLabel];
    }
    return _nameLabel;
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
