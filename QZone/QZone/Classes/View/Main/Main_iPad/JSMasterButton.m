//
//  JSMasterButton.m
//  QZone
//
//  Created by ShenYj on 16/8/4.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSMasterButton.h"
#import "JSMasterItem.h"

@implementation JSMasterButton{
    
    // 模型对象
    JSMasterItem *_item;
    
}


+ (instancetype)buttonWithItem:(JSMasterItem *)item{
    
    return [[self alloc]initWithItem:item];
}

- (instancetype)initWithItem:(JSMasterItem *)item{
    
    self = [super init];
    if (self) {
        // 记录数据
        _item = item;
        // 设置ButtonUI
        [self setupUI];
    }
    return self;
}

//- (void)setHighlighted:(BOOL)highlighted{
//    
//}

- (void)setupUI{
    
    // 取消系统默认的高亮状态渲染
    self.adjustsImageWhenHighlighted = NO;
    
    [self setImage:[UIImage imageNamed:_item.imageName] forState:UIControlStateNormal];
    
    // 设置选中背景图
    [self setImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
    
    // 分隔线
    UIImageView *seperatorImageView = [[UIImageView alloc] init];
    [self addSubview:seperatorImageView];

    
    if (_item.isComposeArea) {
        // 撰写区
        
        // 分割线ImageView
        seperatorImageView.image = [UIImage imageNamed:@"tabbar_separate_g_line_v"];
        [seperatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.mas_equalTo(self);
            make.width.mas_equalTo(2);
        }];
        
        
    }else{
        // 菜单区
        // button整体内容左对齐
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 设置图片间距
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
        // 设置文字的间距
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 60, 0, 0);
        
        // 设置标题
        [self setTitle:_item.title forState:UIControlStateNormal];
        
        
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(kMenumButtonPortraitHeight);
        }];
        
        // 分割线ImageView
        seperatorImageView.image = [UIImage imageNamed:@"tabbar_separate_line"];
        [seperatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(self);
            make.height.mas_equalTo(2);
        }];
        
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
