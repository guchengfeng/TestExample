//
//  JSViewController02.m
//  TestExample
//
//  Created by OPS on 16/7/25.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "JSViewController02.h"
#import "CDWebView.h"
#import "MBProgressHUD.h"

@interface JSViewController02 ()<CDWebViewDelegate>
{
 @private
    CDWebView *_webView;
    MBProgressHUD *_loadingWebView;
}
@end

@implementation JSViewController02

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Test JS OC Each Other（WKWebview）";
    
    /**
     * 初始化 webView
     */
    _webView = [[CDWebView alloc] initWithDelegate:self andView:self.view];
    
    _webView.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:_webView];
    
    
    /**
     *  初始化加载框
     */
    _loadingWebView = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_loadingWebView];
    
    
    /**
     *  开始请求数据
     */
    [self startLoadingWeb];
}

- (void)startLoadingWeb
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"testJS1"ofType:@"html"];
    NSURL *localURL=[[NSURL alloc] initFileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:localURL];
    _webView.request = request;
    [_webView reloadRequestWebData];
}

- (void)viewWillLayoutSubviews
{
    _webView.frame = self.view.bounds;
}

#pragma mark - delegate
- (BOOL)cdWebView:(CDWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(CDWebViewNavigationType)navigationType
{
    return YES;
}

- (NSArray *)arrayOfRegisterToJSFunctionNameWithWebController:(CDWebView *)webController
{
    NSArray *arrFunction=[NSArray arrayWithObjects:@"TestJsCalledOCFunctionName",@"TestJsCalledOCFunction", nil];
    
    return arrFunction;
}

//  js  called  oc
- (void)cdWebView:(CDWebView *)webController didCalledJSFunctionName:(NSString *)functionName andParam:(id)jsonString
{
    if ([functionName isEqualToString:@"TestJsCalledOCFunctionName"]) {
        MTDetailLog(@"js called oc success !   param:%@",jsonString);
    }
    
    else  if ([functionName isEqualToString:@"TestJsCalledOCFunction"]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"AlertViewTest"
                                                        message:@"TestJsCalledOCFunction"
                                                       delegate:nil
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"OtherBtn",nil];
        [alert show];
        
    }
}

@end
