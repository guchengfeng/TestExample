//
//  MainControllerManage.m
//  ZCTabNav
//
//  Created by cuibo on 5/8/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import "MainControllerManage.h"
#import "ZCTabBarController.h"
#import "ZCNavigationController.h"
#import "mainViewController.h"
#import "APIViewController.h"
#import "ArchitectureViewController.h"
#import "SettingViewController.h"
#import "ZCTabBarButton.h"
#import "TabbarTool.h"


@interface MainControllerManage()


@property(strong, nonatomic) UIViewController *mainViewController;              //主视图(tabbar)
@property (strong, nonatomic) ZCTabBarController *tabBarController;             //tabbar;

//TabBarController的内容视图
@property(strong, nonatomic) mainViewController *firstViewController;
@property(strong, nonatomic) APIViewController *secondViewController;
@property(strong, nonatomic) ArchitectureViewController *thirdViewController;
@property(strong, nonatomic) SettingViewController *fourthViewController;

@end


@implementation MainControllerManage

//获取单利
+ (id)shared
{
    static MainControllerManage *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[MainControllerManage alloc] init];
    });
    
    return _shared;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        //创建主视图
        self.mainViewController = [self creatMainController];
    }
    return self;
}

- (UIViewController *)creatMainController
{
    //创建tabbar内容视图
    self.firstViewController = [[mainViewController alloc] init];
    self.secondViewController = [[APIViewController alloc] init];
    self.thirdViewController = [[ArchitectureViewController alloc] init];
    self.fourthViewController = [[SettingViewController alloc] init];
    
    self.firstViewController.title=@"UI组件和模块";
    self.secondViewController.title=@"常用功能";
    self.thirdViewController.title=@"架构和模板";
    self.fourthViewController.title=@"我的";
    
    self.firstViewController.tabBarItem = [TabbarTool itemWithTitle:@"视图" normalImg:@"1" selectImg:@"s1"];
    self.secondViewController.tabBarItem = [TabbarTool itemWithTitle:@"API" normalImg:@"2" selectImg:@"s2"];
    self.thirdViewController.tabBarItem = [TabbarTool itemWithTitle:@"架构" normalImg:@"3" selectImg:@"s3"];
    self.fourthViewController.tabBarItem = [TabbarTool itemWithTitle:@"个人中心" normalImg:@"4" selectImg:@"s4"];
    
    //将内容视图装载到NavigationController里
    ZCNavigationController *navController1 = [[ZCNavigationController alloc] initWithRootViewController:self.firstViewController];
    ZCNavigationController *navController2 = [[ZCNavigationController alloc] initWithRootViewController:self.secondViewController];
    ZCNavigationController *navController3 = [[ZCNavigationController alloc] initWithRootViewController:self.thirdViewController];
    ZCNavigationController *navController4 = [[ZCNavigationController alloc] initWithRootViewController:self.fourthViewController];
    
    
    
    //创建并设置tabBarController
    self.tabBarController = [[ZCTabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, navController2, navController3, navController4, nil];
    self.tabBarController.selectedIndex = 0;

    //设置tabBar中间的按钮
    [self.tabBarController.centerButton setHeightOffset:5];
    [self.tabBarController.centerButton setImage:[UIImage imageNamed:@"icon_publish"]
                                        forState:UIControlStateNormal];
    [self.tabBarController.centerButton setImage:[UIImage imageNamed:@"icon_publish_light"]
                                        forState:UIControlStateHighlighted];
    [self.tabBarController.centerButton addTarget:self
                                           action:@selector(centerButtonPressed)
                                 forControlEvents:UIControlEventTouchUpInside];

    return self.tabBarController;
}


#pragma mark -
#pragma mark - tabbar中间的按钮动作

//按钮按下
- (void)centerButtonPressed
{
    
}


@end


