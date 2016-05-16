//
//  AppDelegate.m
//  YHTabbarViewController
//
//  Created by yh on 16/5/16.
//  Copyright © 2016年 yh. All rights reserved.
//

#import "AppDelegate.h"
#import "YHTabbarController.h"
#import "TestViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.title = @"首页";
    vc1.tabBarItem.badgeValue = @"5";
    vc1.tabBarItem.image = [UIImage imageNamed:@"首页图标"];
    vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"首页图标点击后"];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.title = @"收藏";
    vc2.tabBarItem.image = [UIImage imageNamed:@"收藏图标"];
    vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"收藏图标点击后"];
    vc2.view.backgroundColor = [UIColor cyanColor];
    
    TestViewController *vc3 = [[TestViewController alloc] init];
    vc3.tabBarItem.badgeValue = @"1";
    vc3.title = @"关注";
    vc3.tabBarItem.image = [UIImage imageNamed:@"关注图标"];
    vc3.tabBarItem.selectedImage = [UIImage imageNamed:@"关注图标点击后"];
    vc3.view.backgroundColor = [UIColor purpleColor];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.title = @"我的";
    vc4.tabBarItem.image = [UIImage imageNamed:@"我的图标"];
    vc4.view.backgroundColor = [UIColor blueColor];
    vc4.tabBarItem.selectedImage = [UIImage imageNamed:@"我的图标点击后"];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    
    YHTabbarController *tabbar = [[YHTabbarController alloc] init];
    tabbar.tabBar.tintColor = [UIColor redColor];
    
    
    tabbar.itemTitleFont          = [UIFont boldSystemFontOfSize:11.0f];
    tabbar.itemTitleColor         = [UIColor blueColor];
    tabbar.selectedItemTitleColor = [UIColor redColor];
    tabbar.badgeTitleFont         = [UIFont boldSystemFontOfSize:14.0f];

    tabbar.viewControllers = @[nav1,nav2,nav3,nav4];
    
    
    self.window.rootViewController = tabbar;
    
    
    return YES;
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
