//
//  CustomSpotlight.h
//  MangoCityTravel
//
//  Created by OPS on 16/7/28.
//  Copyright © 2016年 mangocity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomSpotlight : NSObject

+(CustomSpotlight *)sharedInstance;

-(void)creatSearchableItem;

@end
