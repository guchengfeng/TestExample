//
//  JZTabbar.h
//  我的微博
//
//  Created by peijz on 16/1/4.
//  Copyright © 2016年 peijz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JZTabbar;
@protocol JZTabbarDelegate <NSObject>

@optional
- (void)tabBar:(JZTabbar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;
@end

@interface JZTabbar : UIView
-(void)addTabBarWithItem:(UITabBarItem *)item;
@property(nonatomic, weak) id<JZTabbarDelegate> delegate;
@end
