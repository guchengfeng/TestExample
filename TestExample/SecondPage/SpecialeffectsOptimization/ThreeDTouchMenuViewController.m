//
//  3DTouchMenuViewController.m
//  TestExample
//
//  Created by OPS on 16/7/29.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "ThreeDTouchMenuViewController.h"
#import "Masonry.h"

@interface ThreeDTouchMenuViewController ()

@end

@implementation ThreeDTouchMenuViewController

- (void)viewDidLoad {
    
   [super viewDidLoad];
    
}

-(UILabel *)labTitle
{
    if (!_labTitle) {
        _labTitle=[[UILabel alloc]init];
        _labTitle.text=@"";
        _labTitle.font=[UIFont systemFontOfSize:GeneralTitleFont];
        [self.view addSubview:_labTitle];
        [_labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(30);
            make.center.mas_equalTo(self.view);
            
        }];
    }
    return _labTitle;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
