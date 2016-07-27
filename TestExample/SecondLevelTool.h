//
//  SecondLevelTool.h
//  TestExample
//
//  Created by OPS on 16/7/26.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecondLevelTool : NSObject

+ (instancetype)sharedInstance;

+ (void)toThreeLevelPage;

@end
