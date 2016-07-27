//
//  JZTabbarButton.m
//  我的微博
//
//  Created by peijz on 16/1/5.
//  Copyright © 2016年 peijz. All rights reserved.
// 自定义button
#define JZTabbarButtonRatio 0.6

// 按钮的默认文字颜色
#define  JZTabbarButtonTitleColor (iOS7 ? [UIColor whiteColor] : [UIColor whiteColor])
// 按钮的选中文字颜色
#define  JZTabbarButtonTitleSelectedColor (iOS7 ? JZColor(234, 103, 7) : JZColor(248, 139, 0))
#import "JZTabbarButton.h"
#import "JZBadgeButton.h"
@interface JZTabbarButton()
/**
 * 提醒数字按钮
 */
@property(nonatomic, weak) JZBadgeButton * badgeButton;
@end;

@implementation JZTabbarButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 文字据中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 文字大小
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        // 文字默认颜色
        [self setTitleColor:JZTabbarButtonTitleColor forState:UIControlStateNormal];
        // 文字选中颜色
        [self setTitleColor:JZTabbarButtonTitleSelectedColor forState:UIControlStateSelected];
        
        
        if (!iOS7)
        {// 非iOS7下,设置按钮选中时的背景
            [self setBackgroundImage:[UIImage imageWithNamed:@"tabbar_slider"] forState:UIControlStateSelected];
        }
        
        // 添加数字按钮
        JZBadgeButton * badgeButton = [[JZBadgeButton alloc]init];
        
        // 距离右边和上边的距离是固定的
        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted{}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * JZTabbarButtonRatio;
    return CGRectMake(0, 0, imageW, imageH);
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * JZTabbarButtonRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    // KVO监听属性的改变
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

-(void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    // 设置文字
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    // 设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    // 设置提醒数字
    self.badgeButton.badgeValue = self.item.badgeValue;
    
    // 设置提醒数字的位置
    CGFloat badgeY = 5;
    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width - 10;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeButton.frame = badgeF;

}
@end
