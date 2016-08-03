//
//  AppDelegate.m
//  QZone
//
//  Created by ShenYj on 16/8/2.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "AppDelegate.h"
#import "JSTabBarController.h"
#import "JSSplitViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    /*
     UIUserInterfaceIdiomUnspecified = -1,
     UIUserInterfaceIdiomPhone NS_ENUM_AVAILABLE_IOS(3_2),      // iPhone and iPod touch style UI
     UIUserInterfaceIdiomPad NS_ENUM_AVAILABLE_IOS(3_2),        // iPad style UI
     UIUserInterfaceIdiomTV NS_ENUM_AVAILABLE_IOS(9_0),         // Apple TV style UI
     UIUserInterfaceIdiomCarPlay NS_ENUM_AVAILABLE_IOS(9_0),    // CarPlay style UI
     */
    
    if (isiPhone) {
        
        JSTabBarController *tabBarController = [[JSTabBarController alloc] init];
        self.window.rootViewController = tabBarController;
        
    }else{
        
        // 创建splitViewController 在显示前必须设置主视图控制器,可以不设置明细控制器
        JSSplitViewController *splitViewController = [[JSSplitViewController alloc] init];

        self.window.rootViewController = splitViewController;
    }

    [self.window makeKeyAndVisible];
    
    return YES;
}


// 当设置应用的可支持方向时调用
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    
    // 根据不同设备设置支持方向
    if (isiPhone) {
        
        // iPhone
        return UIInterfaceOrientationMaskPortrait;
        
    }else {
        
        // iPad
        return UIInterfaceOrientationMaskAll;
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
