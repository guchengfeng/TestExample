//
//  Custom3DTouch.m
//  MangoCityTravel
//
//  Created by OPS on 16/7/28.
//  Copyright © 2016年 mangocity. All rights reserved.
//

#import "Custom3DTouch.h"

@implementation Custom3DTouch

+(Custom3DTouch *)sharedInstance
{
    __strong static Custom3DTouch *sharedManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[Custom3DTouch alloc] init];
    });
    
    return sharedManager;
}

-(void)touchIcon
{
    UIApplicationShortcutIcon *icon1=[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCaptureVideo];
    UIApplicationShortcutIcon *icon2=[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd];
    UIApplicationShortcutIcon *icon3=[UIApplicationShortcutIcon iconWithTemplateImageName:@"search"];
    //快捷菜单
    UIApplicationShortcutItem *item1=[[UIApplicationShortcutItem alloc]initWithType:@"1"
                                                                     localizedTitle:@"赵丽颖"
                                                                  localizedSubtitle:nil
                                                                               icon:icon1
                                                                           userInfo:nil];
    UIApplicationShortcutItem *item2=[[UIApplicationShortcutItem alloc]initWithType:@"1"
                                                                     localizedTitle:@"关晓彤"
                                                                  localizedSubtitle:@"一言不合就直播"
                                                                               icon:icon2
                                                                           userInfo:nil];
    UIApplicationShortcutItem *item3=[[UIApplicationShortcutItem alloc]initWithType:@"1"
                                                                     localizedTitle:@"贾青"
                                                                  localizedSubtitle:nil
                                                                               icon:icon3
                                                                           userInfo:nil];
    [[UIApplication sharedApplication] setShortcutItems:@[item1,item2,item3]];
}

@end
