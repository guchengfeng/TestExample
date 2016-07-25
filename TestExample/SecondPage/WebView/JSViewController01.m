//
//  JSViewController01.m
//  TestExample
//
//  Created by OPS on 16/7/25.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "JSViewController01.h"

@interface JSViewController01 ()<UIWebViewDelegate>
{
  @private
    UIWebView *webView;
}

@end

@implementation JSViewController01

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Test JS OC (重定向回调)";

    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"testJS" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.delegate = self;
    [self.view addSubview:webView];
    [webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:filePath]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *requestString = [[request URL] absoluteString];
    NSArray *components = [requestString componentsSeparatedByString:@":"];
    if ([components count] > 1 && [(NSString *)[components objectAtIndex:0] isEqualToString:@"testapp"])
    {
        NSString *strMessage= [NSString stringWithFormat:@"%s", [[components objectAtIndex:1] UTF8String]];
        UIAlertView *alert = [[UIAlertView alloc]
                            initWithTitle:@"触发点击事件!"
                            message:strMessage
                            delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:@"OK", nil];
        [alert show];
        return NO;
    }
    return YES;
}

@end
