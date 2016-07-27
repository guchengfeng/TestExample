//
//  SecondLevelTool.m
//  TestExample
//
//  Created by OPS on 16/7/26.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "SecondLevelTool.h"
#import "SecondLevelViewController.h"

@implementation SecondLevelTool

+ (instancetype)sharedInstance
{
    static SecondLevelTool* instance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [SecondLevelTool new];
    });

    return instance;
}

+ (void)toThreeLevelPage:(SecondLevelViewController *)currentController :(NSInteger)oneItem :(NSInteger)secondItem
{
    
}

@end
