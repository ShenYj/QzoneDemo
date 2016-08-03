//
//  JSTabBar.m
//  QZone
//
//  Created by ShenYj on 16/8/3.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSTabBar.h"

static const NSInteger childViewControllerCounts = 5; // 包含中心的按钮

@interface JSTabBar ()

// 中间的按钮
@property (nonatomic,strong) UIButton *composeButton;

@end

@implementation JSTabBar {
    
    UIImage *_image;
}


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _image = [UIImage imageNamed:@"tabbar_btn"];
        // 添加中间的Button
        [self addSubview:self.composeButton];
        
        [self.composeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self);
            make.height.mas_equalTo(self);
        }];
        
    }
    return self;
}

// ComposeButton点击事件
- (void)clickComposeButton:(UIButton *)sender{
    
    self.composeButtonBlock();
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat TabBarButtonWidth = self.bounds.size.width / childViewControllerCounts;
    NSInteger barButtonItemIndex = 0;
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            if (barButtonItemIndex == 2) {
                barButtonItemIndex++;
            }
            
            CGRect frame = view.frame;
            frame.origin.x = barButtonItemIndex * TabBarButtonWidth;
            frame.size.width = TabBarButtonWidth;
            view.frame = frame;
            
            barButtonItemIndex++;
        }
        
    }
    
    
}

- (UIButton *)composeButton{
    if (_composeButton == nil) {
        _composeButton = [[UIButton alloc] init];
        _composeButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_composeButton setImage:_image forState:UIControlStateNormal];
        [_composeButton addTarget:self action:@selector(clickComposeButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _composeButton;
}

@end
