//
//  KeyBoradListerViewController.h
//  TestMasonry
//
//  Created by OPS on 16/4/20.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyBoradListerViewController : UIViewController<UITextFieldDelegate>
{
    UITextField *textField;
}

-(IBAction)returnButtonPressed:(id)sender;

@end
