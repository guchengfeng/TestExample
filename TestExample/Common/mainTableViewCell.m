//
//  mainTableViewCell.m
//  TestExample
//
//  Created by OPS on 16/7/25.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "mainTableViewCell.h"

@interface mainTableViewCell ()

@end

@implementation mainTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"mainTableViewCellIdentifier";
    // 1.缓存中取
    mainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[mainTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y, SCREEN_WIDTH, self.frame.size.height);
        
        _labelContent=[[UILabel alloc]init];
        _labelContent.frame=CGRectMake(20, 0, SCREEN_WIDTH, self.frame.size.height);
        _labelContent.font=[UIFont systemFontOfSize:GeneralTitleFont];
        [self addSubview:_labelContent];
        
        _imgLine=[[UIImageView alloc]init];
        _imgLine.frame=CGRectMake(0, self.frame.size.height-1, SCREEN_WIDTH, 1);
        _imgLine.backgroundColor=[UIColor grayColor];
        _imgLine.alpha=0.5;
        [self addSubview:_imgLine];
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
