//
//  mainTableViewCell.h
//  TestExample
//
//  Created by OPS on 16/7/25.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mainTableViewCell : UITableViewCell

@property (strong , nonatomic) IBOutlet UILabel *labelContent;

@property (strong , nonatomic) IBOutlet UIImageView *imgLine;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
