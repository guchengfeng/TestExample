//
//  masonryExzample3.m
//  TestMasonry
//
//  Created by OPS on 16/4/20.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "masonryExzample3.h"
#import "Masonry.h"

@interface masonryExzample3 ()

@end

@implementation masonryExzample3

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    
    yellow = [UIView new];
    yellow.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellow];
    
    red = [UIView new];
    red.backgroundColor = [UIColor redColor];
    [self.view addSubview:red];
    
 
    switch (_exType) {
        case 2:
            [self ex1];
            break;
            
        case 3:
            [self ex2];
            break;
            
        default:
            break;
    }
   
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
  
}

-(IBAction)returnButtonPresse:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


-(void)ex1
{
    [yellow mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(400, 200));
        make.top.mas_equalTo(yellow.superview).offset(200);
        make.bottom.mas_equalTo(red.mas_top).offset(-50);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        
    }];
    
    [red mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(200, 100));
        make.centerX.mas_equalTo(yellow);
        
    }];
}

-(void)ex2
{
    [yellow mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(200, 200));
        make.top.and.left.mas_equalTo(100);
        
    }];
    
    [red mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.top.and.left.mas_equalTo(yellow);
        
    }];
}


@end
