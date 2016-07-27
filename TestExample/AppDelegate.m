//
//  AppDelegate.m
//  TestExample
//
//  Created by OPS on 16/7/20.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "AppDelegate.h"
#import "mainViewController.h"
#import "GCFTabBarController.h"
#import "mainViewController.h"
#import "APIViewController.h"
#import "ArchitectureViewController.h"
#import "SettingViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    GCFTabBarController *tabBarController = [[GCFTabBarController alloc]init];
    _navigationController= [[UINavigationController alloc] initWithRootViewController:tabBarController];
    
    //视图
    mainViewController * home = [[mainViewController alloc]initWithStyle:UITableViewStylePlain];
    home.tabBarItem.badgeValue = @"12";
    [tabBarController tabbarWithController:home withName:@"视图" withImageName:@"tabbar_home" withSelectedImageName:@"tabbar_home_selected"];
    
    //功能
    APIViewController * message = [[APIViewController alloc]initWithStyle:UITableViewStylePlain];
    message.tabBarItem.badgeValue = @"new";
    [tabBarController tabbarWithController:message withName:@"API" withImageName:@"tabbar_message_center" withSelectedImageName:@"tabbar_message_center_selected"];
    
    
    //架构
    ArchitectureViewController * discover = [[ArchitectureViewController alloc]initWithStyle:UITableViewStylePlain];
    discover.tabBarItem.badgeValue = @"9";
    [tabBarController tabbarWithController:discover withName:@"架构" withImageName:@"tabbar_discover" withSelectedImageName:@"tabbar_discover_selected"];
    
    
    //我
    SettingViewController * me = [[SettingViewController alloc]initWithStyle:UITableViewStylePlain];
    me.tabBarItem.badgeValue = @"100";
    [tabBarController tabbarWithController:me withName:@"我" withImageName:@"tabbar_profile" withSelectedImageName:@"tabbar_profile_selected"];
    
    _window.rootViewController=_navigationController;
    [self.window makeKeyAndVisible];
    
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
