//
//  UIImage+Color.h
//  ToolBar
//
//  Created by ShenYj on 16/7/29.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

/**
 *  创建纯色图片
 *
 *  @param color     生成纯色图片的颜色
 *  @param imageSize 需要创建纯色图片的尺寸
 *
 *  @return 纯色图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color withSize:(CGSize)imageSize;
/**
 *  创建圆角图片
 *
 *  @param originalImage 原始图片
 *
 *  @return 带圆角的图片
 */
+ (UIImage *)imageWithOriginalImage:(UIImage *)originalImage;
/**
 *  创建圆角纯色图片
 *
 *  @param color     设置圆角纯色图片的颜色
 *  @param imageSize 设置元角纯色图片的尺寸
 *
 *  @return 圆角纯色图片
 */
+ (UIImage *)createRoundedImageWithColor:(UIColor *)color withSize:(CGSize)imageSize;
/**
 *  生成带圆环的圆角图片
 *
 *  @param originalImage 原始图片
 *  @param borderColor   圆环颜色
 *  @param borderWidth   圆环宽度
 *
 *  @return 带圆环的圆角图片
 */
+ (UIImage *)imageWithOriginalImage:(UIImage *)originalImage withBorderColor:(UIColor *)borderColor withBorderWidth:(CGFloat)borderWidth;

@end
