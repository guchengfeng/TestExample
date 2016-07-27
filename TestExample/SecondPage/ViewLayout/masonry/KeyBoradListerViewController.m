//
//  KeyBoradListerViewController.m
//  TestMasonry
//
//  Created by OPS on 16/4/20.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "KeyBoradListerViewController.h"
#import "Masonry.h"

@interface KeyBoradListerViewController ()

@end

@implementation KeyBoradListerViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    textField = [[UITextField alloc] init];
    textField.delegate=self;
    textField.backgroundColor=[UIColor redColor];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:textField];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        

        make.left.mas_equalTo(20);
        make.height.mas_equalTo(50);
        make.right.mas_equalTo(-100);
        make.bottom.mas_equalTo(-200);
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(IBAction)returnButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}



-(void)keyboardWillShow:(NSNotification*)noti {
    // 获取键盘基本信息（动画时长与键盘高度）
    NSDictionary *userInfo = [noti userInfo];
    CGRect rect =
    [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    CGFloat keyboardHeight = CGRectGetHeight(rect);
  //  CGFloat keyboardDuration =[userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 修改下边距约束
    [textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-keyboardHeight);
        make.right.mas_equalTo(-10);
    }];
    
}

-(void)keyboardWillHide:(NSNotification*)noti {
    
    // 修改下边距约束
    [textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-200);
    }];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
