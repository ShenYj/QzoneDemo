//
//  JSComposeItem.h
//  QZone
//
//  Created by ShenYj on 16/8/4.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <Foundation/Foundation.h>

// 撰写区按钮模型类 记录撰写区按钮的数据
@interface JSMasterItem : NSObject

// 按钮的标题
@property (nonatomic,copy) NSString *title;
// 按钮的图片名
@property (nonatomic,copy) NSString *imageName;
// 按钮所处区域标识
@property (nonatomic,assign,getter=isComposeArea) BOOL composeArea;
// 视图控制器名
@property (nonatomic,copy) NSString *controllerClassName;
// 分段控件的数据
@property (nonatomic,strong) NSArray *segmetnItem;

// 类方法
+ (instancetype)itemWithDict:(NSDictionary *)dict;


@end
