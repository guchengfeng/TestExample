//
//  ViewController.h
//  TestAFNetWorking
//
//  Created by OPS on 16/4/18.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCFAFNetWorking.h"

@interface GCFAFViewController: UIViewController

@property (strong,nonatomic)  UIButton *buttonGetRequest;

@property (strong,nonatomic)  UIButton *buttonPostRequest;

@property (strong,nonatomic)  UIProgressView *progressView;

-(void)getRequestButtonPressed;

-(void)postRequestButtonPressed;

-(void)downLoadRequestButtonPressed;


@end

