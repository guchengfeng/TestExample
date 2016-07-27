//
//  GCFAFNetWorking.h
//  TestAFNetWorking
//
//  Created by OPS on 16/4/18.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCFAFNetWorking : NSObject

+(GCFAFNetWorking *)sharedInstance;

-(void)getReuqest:(NSString *)url;

-(void)postReuqest:(NSString *)url :(NSMutableDictionary *)dicParam;

-(void)downRequest:(NSString *)url;

@end
