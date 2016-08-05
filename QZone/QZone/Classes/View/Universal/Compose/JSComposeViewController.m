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
}


- (instancetype)initWithTitle:(NSString *)title{
    
    self = [super init];
    if (self) {
        _navigationTitle = title;
        
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
