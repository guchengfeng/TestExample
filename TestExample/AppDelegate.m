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
#import "MainControllerManage.h"
#import "Custom3DTouch.h"
#import "CustomSpotlight.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [[MainControllerManage shared] mainViewController];
    
    [[CustomSpotlight sharedInstance] creatSearchableItem];
    [[Custom3DTouch sharedInstance] touchIcon];
    
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

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler{
    
    NSString* idetifier = userActivity.userInfo[@"kCSSearchableItemActivityIdentifier"];        //获取传入的索引数据的唯一标识
    if ([idetifier isEqualToString:@"1"]) {
        
    }
    NSLog(@"idetifier:%@",idetifier);
    return YES;
}

-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    NSString *title;
    if([shortcutItem.localizedTitle isEqualToString:@"赵丽颖"])
    {
        title=@"赵丽颖";
    }
    else if([shortcutItem.localizedTitle isEqualToString:@"关晓彤"])
    {
        title=@"关晓彤";
    }
    else if([shortcutItem.localizedTitle isEqualToString:@"贾青"])
    {
        title=@"贾青";
    }
}

@end
