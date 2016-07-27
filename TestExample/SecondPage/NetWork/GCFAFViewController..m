//
//  ViewController.m
//  TestAFNetWorking
//

/*

1.指定宽和高 make.size.mas_equalTo(CGSizeMake(300, 300));
2.指定中心点 make.center.mas_equalTo(self.view);
3.指定上下左右的间距
 UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
 [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
 make.top.equalTo(superview.mas_top).with.offset(padding.top); //with is an optional semantic filler
 make.left.equalTo(superview.mas_left).with.offset(padding.left);
 make.bottom.equalTo(superview.mas_bottom).with.offset(-padding.bottom);
 make.right.equalTo(superview.mas_right).with.offset(-padding.right);
 }];
 
make.edges.equalTo(superview).with.insets(padding);

//
 
 */

#import "GCFAFViewController.h"
#import "Const.h"
#import "AFHTTPSessionManager.h"

@interface GCFAFViewController ()

@end

@implementation GCFAFViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self.buttonGetRequest addTarget:self action:@selector(getRequestButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonPostRequest addTarget:self action:@selector(postRequestButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.progressView setProgress:0];
}

-(UIButton *)buttonGetRequest
{
    if (!_buttonGetRequest) {
        _buttonGetRequest=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_buttonGetRequest setTitle:@"Get请求" forState:UIControlStateNormal];
        [_buttonGetRequest setTitle:@"Get请求" forState:UIControlStateSelected];
        [self.view addSubview:_buttonGetRequest];
        [_buttonGetRequest mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view).with.offset(150);
            make.width.equalTo(@185);
            make.height.equalTo(@38);
        }];
    }
    return _buttonGetRequest;
}

-(UIButton *)buttonPostRequest
{
    if (!_buttonPostRequest) {
        _buttonPostRequest=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_buttonPostRequest setTitle:@"Post请求" forState:UIControlStateNormal];
        [_buttonPostRequest setTitle:@"Post请求" forState:UIControlStateSelected];
        [self.view addSubview:_buttonPostRequest];
        [_buttonPostRequest mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(_buttonGetRequest).with.offset(150);
            make.width.equalTo(@185);
            make.height.equalTo(@38);
        }];
    }
    return _buttonPostRequest;
}

-(UIProgressView *)progressView
{
    if (!_progressView) {
        _progressView=[[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
        [self.view addSubview:_progressView];
        [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(_buttonPostRequest).with.offset(150);
            make.width.equalTo(@185);
            make.height.equalTo(@10);
        }];
    }
    return _progressView;
}

-(void)getRequestButtonPressed
{
//    NSString *strUrl=[TestUrl stringByAppendingString:@"date=20131129&startRecord=1&len=5&udid=1234567890&terminalType=Iphone&cid=213"];
    
    [[GCFAFNetWorking sharedInstance] getReuqest:TestUrl];
}

-(void)postRequestButtonPressed
{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"20131129", @"date", @"1", @"startRecord", @"5", @"len", @"1234567890", @"udid", @"Iphone", @"terminalType", @"213", @"cid", nil];
    NSMutableDictionary *dicParam=(NSMutableDictionary *)dic;
    
    [[GCFAFNetWorking sharedInstance] postReuqest:TestUrl1:dicParam];
}

-(void)downLoadRequestButtonPressed
{
    [[GCFAFNetWorking sharedInstance] downRequest:@""];
}


@end
