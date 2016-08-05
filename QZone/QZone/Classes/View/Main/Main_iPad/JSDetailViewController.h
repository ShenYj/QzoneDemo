//
//  JSDetailViewController.h
//  QZone
//
//  Created by ShenYj on 16/8/5.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JSMasterItem;
@interface JSDetailViewController : UIViewController
- (instancetype)initWithMasterItem:(JSMasterItem *)item;
@end
