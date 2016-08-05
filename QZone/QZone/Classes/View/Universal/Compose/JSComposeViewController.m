//
//  JSComposeViewController.m
//  QZone
//
//  Created by ShenYj on 16/8/3.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSComposeViewController.h"

@interface JSComposeViewController ()

@end

@implementation JSComposeViewController{
    
    NSString *_navigationTitle;
    void (^_completeBlock)();
}


- (instancetype)initWithTitle:(NSString *)title completeBlock:(void (^)())completeBlock{
    
    self = [super init];
    if (self) {
        
        _navigationTitle = title;
        _completeBlock = completeBlock;
        
        [self prepareComposeView];
    }
    return self;
}

// 设置撰写控制器
- (void)prepareComposeView{
    
    self.title = _navigationTitle;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftBarButtonItem:)];
}

- (void)clickLeftBarButtonItem:(UIBarButtonItem *)sender{
    
    // 完成回调
    
//    NSAssert(_completeBlock != nil, @"_completeBlock is nil");  手机TabBar控制器下,不需要考虑菜单区的按钮重设,完成回调传递了nil,所以不能使用断言处理
//        _completeBlock();
    if (_completeBlock) {
        _completeBlock();
    }

    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
