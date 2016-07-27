//
//  JZWeiBoTabBarController.m
//  我的微博
//
//  Created by peijz on 16/1/4.
//  Copyright © 2016年 peijz. All rights reserved.
//

#import "GCFTabBarController.h"
#import "JZTabbar.h"
#import "JZTabbarButton.h"
#import "JZBadgeButton.h"

@interface GCFTabBarController()<JZTabbarDelegate>
@property(nonatomic, weak) JZTabbar * customTabbar;
@end

@implementation GCFTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setTabar];
}

// 删除系统自动生成的tabbar
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView * child in self.tabBar.subviews)
    {
        if ([child isKindOfClass:[UIControl class]])
        {
            [child removeFromSuperview];
        }
    }
    
}

/**
 * 加载tabbar
 */
-(void)setTabar
{
    JZTabbar * customTabbar = [[JZTabbar alloc]init];
    customTabbar.delegate = self;
    customTabbar.frame = self.tabBar.frame;
    [self.view addSubview:customTabbar];
    self.customTabbar = customTabbar;
    
}

/**
 * 实现代理方法
 */

-(void)tabBar:(JZTabbar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

///**
// * 初始化自控制器
// */
//-(void)setChildController
//{
//    // 首页
//    JZHomeTableViewController * home = [[JZHomeTableViewController alloc]initWithStyle:UITableViewStylePlain];
//    home.tabBarItem.badgeValue = @"12";
//    [self tabbarWithController:home withName:@"首页" withImageName:@"tabbar_home" withSelectedImageName:@"tabbar_home_selected"];
//    
//    // 消息
//    JZMessageTableViewController * message = [[JZMessageTableViewController alloc]initWithStyle:UITableViewStylePlain];
//    message.tabBarItem.badgeValue = @"new";
//    [self tabbarWithController:message withName:@"消息" withImageName:@"tabbar_message_center" withSelectedImageName:@"tabbar_message_center_selected"];
//    
//    
//    // 广场
//    JZDiscoverTableViewController * discover = [[JZDiscoverTableViewController alloc]initWithStyle:UITableViewStylePlain];
//    discover.tabBarItem.badgeValue = @"9";
//    [self tabbarWithController:discover withName:@"广场" withImageName:@"tabbar_discover" withSelectedImageName:@"tabbar_discover_selected"];
//    
//    
//    // 我
//    JZMeTableViewController * me = [[JZMeTableViewController alloc]initWithStyle:UITableViewStylePlain];
//    me.tabBarItem.badgeValue = @"100";
//    [self tabbarWithController:me withName:@"我" withImageName:@"tabbar_profile" withSelectedImageName:@"tabbar_profile_selected"];
//}


/**
 * 创建tabbar
 */
-(void)tabbarWithController:(UIViewController*)viewCon withName:(NSString *)name withImageName:(NSString *)imageName withSelectedImageName:(NSString *)selectedImageName
{
    // 设置控制器的属性
    viewCon.title = name;
    
    
    // 设置控制器的图片
    viewCon.tabBarItem.image = [UIImage imageWithNamed:imageName];
    viewCon.tabBarItem.selectedImage = [[UIImage imageWithNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 包装控制器
    UINavigationController * viewConNav = [[UINavigationController alloc]initWithRootViewController:viewCon];
    [self addChildViewController:viewConNav];
    
    // 添加tabbar内部的按钮
    [self.customTabbar addTabBarWithItem:viewCon.tabBarItem];
}

@end
