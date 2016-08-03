//
//  UIColor+RandomColor.h
//  MajorForum
//
//  Created by ShenYj on 16/7/29.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RandomColor)

/**
 *  设置RGB颜色
 *
 *  @param red   red: 0 ~ 255
 *  @param green green: 0 ~ 255
 *  @param blue  blue: 0 ~ 255
 *
 *  @return RGB颜色
 */
+ (UIColor *)RGBColorWithRed:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue;

/**
 *  生成随机色
 *
 *  @return 返回随机色
 */
+ (UIColor *)randomColor;

@end
