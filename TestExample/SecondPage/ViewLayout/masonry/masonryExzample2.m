//
//  masonryExzample2.m
//  TestMasonry
//
//  Created by OPS on 16/4/20.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "masonryExzample2.h"
#import "Masonry.h"

@interface masonryExzample2 ()

@end

@implementation masonryExzample2

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIButton *buttonRed1 = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonRed1.backgroundColor=[UIColor redColor];
    [self.view addSubview:buttonRed1];
    
    [buttonRed1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(50,50));
    }];
    
    [buttonRed1 mas_makeConstraints:^(MASConstraintMaker *make) {
      //  make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-100);
        make.top.mas_equalTo(100);
        make.bottom.mas_equalTo(-100);
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

-(IBAction)returnButtonPresse:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
