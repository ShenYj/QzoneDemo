//
//  JSComposeViewController.h
//  QZone
//
//  Created by ShenYj on 16/8/3.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface JSComposeViewController : UIViewController

- (instancetype)initWithTitle:(NSString *)title completeBlock:(void(^)())completeBlock;

@end
