//
//  JZWeiBoTabBarController.h
//  我的微博
//
//  Created by peijz on 16/1/4.
//  Copyright © 2016年 peijz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCFTabBarController: UITabBarController

-(void)tabbarWithController:(UIViewController*)viewCon withName:(NSString *)name withImageName:(NSString *)imageName withSelectedImageName:(NSString *)selectedImageName;

@end
