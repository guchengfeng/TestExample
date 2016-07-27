//
//  JZTabbar.m
//  我的微博
//
//  Created by peijz on 16/1/4.
//  Copyright © 2016年 peijz. All rights reserved.
// 自定义tabbar
#import "JZTabbar.h"
#import "JZTabbarButton.h"
@interface JZTabbar()
@property(nonatomic, weak) JZTabbarButton * selectedTabbar;
@property(nonatomic, strong) NSMutableArray* buttonArr;
@end

@implementation JZTabbar

-(NSMutableArray *)buttonArr
{
    if (_buttonArr == nil)
    {
        _buttonArr = [NSMutableArray array];
    }
    return _buttonArr;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (self)
        {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
        }
        
    }
    return self;
}


/**
 * 添加按钮
 */
-(void)addTabBarWithItem:(UITabBarItem *)item
{
    // 1 创建按钮
    JZTabbarButton * button = [[JZTabbarButton alloc]init];
    [self addSubview:button];
    // 添加到数组
    [self.buttonArr addObject:button];
    
    // 2 设置数据
    button.item = item;
    
    // 3 监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    // 4 默认选中第0个按钮
    if (self.subviews.count == 1)
    {
        [self buttonClick:button];
    }
}

/**
 * 设置子控件布局
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    for (int i = 0 ; i < self.subviews.count; i++)
    {
        // 取出按钮
        JZTabbarButton * button = self.subviews[i];
        
        // 设置按钮的frame
        CGFloat buttonX = i * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 绑定tag值
        
        button.tag = i;
    }
}

// 按钮的点击事件
-(void)buttonClick:(JZTabbarButton *)sender
{
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)])
    {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedTabbar.tag to:sender.tag];
    }
    
    // 1 取消选中
    self.selectedTabbar.selected = NO;
    
    // 2 选中
    sender.selected = YES;
    
    // 3 赋值
    self.selectedTabbar = sender;
}

@end
