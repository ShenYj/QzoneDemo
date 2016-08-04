//
//  JSComposeItem.h
//  QZone
//
//  Created by ShenYj on 16/8/4.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <Foundation/Foundation.h>

// 撰写区按钮模型类 记录撰写区按钮的数据
@interface JSComposeItem : NSObject

// 按钮的标题
@property (nonatomic,copy) NSString *title;
// 按钮的图片名
@property (nonatomic,copy) NSString *imageName;

// 类方法
+ (instancetype)itemWithDict:(NSDictionary *)dict;


@end
