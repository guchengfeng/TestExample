//
//  GCFAFNetWorking.m
//  TestAFNetWorking
//
//  Created by OPS on 16/4/18.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "GCFAFNetWorking.h"
#import "AFHTTPSessionManager.h"


@implementation GCFAFNetWorking

/**
 *  单例模式。。。
 *
 *  @return 返回一个全局唯一的GCFAFNetWorking
 */

+(GCFAFNetWorking *)sharedInstance
{
    __strong static GCFAFNetWorking *sharedManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[GCFAFNetWorking alloc] init];
    });
    
    return sharedManager;
}

/**
 *  GET。。。
 *
 *  @return 返回一个全局唯一的GCFAFNetWorking
 */


-(void)getReuqest:(NSString *)url
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


/**
 *  post。。。
 *
 *  @return 返回一个全局唯一的GCFAFNetWorking
 */


-(void)postReuqest:(NSString *)url :(NSMutableDictionary *)dicParam
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    [session POST:url parameters:dicParam progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           NSMutableDictionary *dic= (NSMutableDictionary *)responseObject;
           NSLog(@"diccc:%@",dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

-(void)downRequest:(NSString *)url
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        //下载进度
        NSLog(@"%@",downloadProgress);
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            
            
        }];
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //下载到哪个文件夹
        NSString *homeDir = NSHomeDirectory();
        
        NSLog(@"homeDic:%@",homeDir);
        
        NSString *fileName=[homeDir stringByAppendingString:@"/Document/Mp4"];
        
        return [NSURL fileURLWithPath:fileName];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        //下载完成了
        NSLog(@"下载完成了 %@",filePath);
    }];
    
    [downloadTask resume];

}

@end
