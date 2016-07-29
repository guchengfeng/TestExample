//
//  CustomSpotlight.m
//  MangoCityTravel
//
//  Created by OPS on 16/7/28.
//  Copyright © 2016年 mangocity. All rights reserved.
//

#import "CustomSpotlight.h"

#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/MobileCoreServices.h>

@implementation CustomSpotlight

+(CustomSpotlight *)sharedInstance
{
    __strong static CustomSpotlight *sharedManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[CustomSpotlight alloc] init];
    });
    
    return sharedManager;
}

-(void)creatSearchableItem{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 9

    CSSearchableItemAttributeSet *attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString *)kUTTypeImage];
    
    // 标题
    attributeSet.title = @"古成风";
    // 关键字,NSArray可设置多个
    attributeSet.keywords = @[@"李白",@"漂洋过海来看你",@"花心",@"夏威夷",@"普吉岛"];
    // 描述
    attributeSet.contentDescription = @"要是能重来，我要选李白！";
    // 图标, NSData格式
    attributeSet.thumbnailData = UIImagePNGRepresentation([UIImage imageNamed:@"icon"]);
    // Searchable item
    CSSearchableItem *item = [[CSSearchableItem alloc] initWithUniqueIdentifier:@"1" domainIdentifier:@"linkedme.cc" attributeSet:attributeSet];
    
    NSMutableArray *searchItems = [NSMutableArray arrayWithObjects:item, nil];
    //indexSearchableItems 接收参数NSMutableArray
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:searchItems completionHandler:^(NSError * error) {
        if (error) {
            NSLog(@"索引创建失败:%@",error.localizedDescription);
        }else{
            NSLog(@"索引创建成功:%@",error.localizedDescription);
        }
    }];
    
#endif
}


@end
