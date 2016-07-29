//
//  ImagePlayViewController.m
//  TestExample
//
//  Created by OPS on 16/7/25.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "ImagePlayViewController.h"
#import "GCFImagePlay.h"

@interface ImagePlayViewController ()<SDCycleScrollViewDelegate>

@property (strong , nonatomic)GCFImagePlay *imgPlay;

@property (strong , nonatomic) SDCycleScrollView *scrollAdvertisView;

@end

@implementation ImagePlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *tempURL = [[NSMutableArray alloc] initWithObjects:
                               @"http://img4.imgtn.bdimg.com/it/u=1011977979,3621886187&fm=206&gp=0.jpg",
                               @"http://n.sinaimg.cn/transform/20151105/ACFM-fxkniur2865675.jpg",
                               @"http://cdn2.bjweekly.com/news/image2/150/10616685084734010518.jpg",
                               @"http://img0.imgtn.bdimg.com/it/u=4280416215,2954626495&fm=206&gp=0.jpg",
                               @"http://img3.imgtn.bdimg.com/it/u=1982540213,2383840400&fm=206&gp=0.jpg",
                               nil];
    
    _imgPlay = [[GCFImagePlay alloc]initWithFrame:self.view.bounds];
    [_imgPlay initCycleScrollViewWithImageList:tempURL andImagViewContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:_imgPlay];
    [_imgPlay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREENH_HEIGHT-100));
    }];
    _imgPlay.backgroundColor=[UIColor clearColor];
    
    _scrollAdvertisView = [_imgPlay cycleScrollView];
    _scrollAdvertisView.backgroundColor=[UIColor clearColor];
    _scrollAdvertisView.delegate=self;
    _scrollAdvertisView.backgroundColor=[UIColor groupTableViewBackgroundColor];
}

-(void)injected{
    NSLog(@"I've been injected: %@", self);
    
    
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
	
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
	
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
