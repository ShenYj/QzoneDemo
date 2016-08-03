//
//  JSMasterViewController.m
//  QZone
//
//  Created by ShenYj on 16/8/3.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSMasterViewController.h"


@interface JSMasterViewController ()

// 主视图容器
@property (weak, nonatomic) IBOutlet UIView *masterContainerView;

@end

@implementation JSMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showContainerView:YES];
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
