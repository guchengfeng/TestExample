//
//  CDAdvertisingCell.h
//  MangoCityTravel
//
//  Created by Cindy on 16/6/21.
//  Copyright © 2016年 mangocity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"


@interface GCFImagePlay : UIView

- (void)initCycleScrollViewWithImageList:(NSArray *)imageList;
- (void)initCycleScrollViewWithImageList:(NSArray *)imageList andImagViewContentMode:(UIViewContentMode)mode;
- (SDCycleScrollView *)cycleScrollView;

@end
