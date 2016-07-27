//
//  masonryExzample1.m
//  TestMasonry
//
//  Created by OPS on 16/4/20.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "masonryExzample1.h"
#import "Masonry.h"

@interface masonryExzample1 ()

@end

@implementation masonryExzample1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    UIView *yellow = [[UIView alloc]init];
    yellow.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellow];
    
    UIView *green = [[UIView alloc]init];
    green.backgroundColor = [UIColor greenColor];
    [self.view addSubview:green];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(70);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.5);
        make.left.equalTo(self.view.mas_left).offset(0);
        
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(redView.mas_left).offset(0);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.5);
        make.top.equalTo(redView.mas_bottom).offset(0);
        
    }];
    
    [yellow mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(redView.mas_right).offset(0);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.5);
        make.top.equalTo(redView.mas_top).offset(0);
        
    }];
    
    
    [green mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(redView.mas_right).offset(0);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.5);
        make.top.equalTo(yellow.mas_bottom).offset(0);
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)returnButtonPressed:(id)sender
{
   [self dismissViewControllerAnimated:YES completion:^{
       
   }];
}

@end
