//
//  CDAdvertisingCell.m
//  MangoCityTravel
//
//  Created by Cindy on 16/6/21.
//  Copyright © 2016年 mangocity. All rights reserved.
//

#import "GCFImagePlay.h"


@interface GCFImagePlay ()
{
    SDCycleScrollView *_scrollAdvertisView;
}

@end
@implementation GCFImagePlay

- (void)initCycleScrollViewWithImageList:(NSArray *)imageList
{
    if ([self.subviews containsObject:_scrollAdvertisView]) {
        [_scrollAdvertisView setImageURLStringsGroup:imageList];
    } else {
        _scrollAdvertisView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds imageURLStringsGroup:imageList];
        _scrollAdvertisView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        _scrollAdvertisView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _scrollAdvertisView.placeholderImage = [UIImage imageNamed:@"picture.png"];
        _scrollAdvertisView.hidesForSinglePage = YES;
        _scrollAdvertisView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
        _scrollAdvertisView.pageDotColor = [UIColor lightGrayColor];
        _scrollAdvertisView.pageControlDotSize = CGSizeMake(7.0, 7.0);
        _scrollAdvertisView.autoScrollTimeInterval = 5.0;
        if ([imageList count] <= 1) {
            _scrollAdvertisView.autoScroll = NO;
        } else {
            _scrollAdvertisView.autoScroll = YES;
        }
        [self addSubview:_scrollAdvertisView];
        [_scrollAdvertisView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
    }
    [self layoutIfNeeded];
}

- (void)initCycleScrollViewWithImageList:(NSArray *)imageList andImagViewContentMode:(UIViewContentMode)mode
{
    [self initCycleScrollViewWithImageList:imageList];
    [_scrollAdvertisView setBannerImageViewContentMode:mode];
    [_scrollAdvertisView clearCache];
    [_scrollAdvertisView setImageURLStringsGroup:imageList];
    [self layoutIfNeeded];
}

- (SDCycleScrollView *)cycleScrollView
{
    return _scrollAdvertisView;
}

@end
