//
//  APIViewController.m
//  TestExample
//
//  Created by OPS on 16/7/26.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "APIViewController.h"
#import "mainTableViewCell.h"
#import "RootNetWorkViewController.h"
#import "RootMapViewController.h"
#import "RootViewLayoutViewController.h"

@interface APIViewController ()

@property (strong,nonatomic)NSMutableArray *arrData;

@property (strong,nonatomic)UITableView *tableview;

@end

@implementation APIViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSURL *plistFile = [[NSBundle mainBundle] URLForResource:plist_APIItem withExtension:@"plist"];
    _arrData = [[NSMutableArray alloc] initWithContentsOfURL:plistFile];
    [self.tableview reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma --mark 懒加载

-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
        _tableview.delegate=self;
        _tableview.dataSource=self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableview];
    }
    return _tableview;
}

#pragma --mark uitableview的代理

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    mainTableViewCell *cell = [mainTableViewCell cellWithTableView:tableView];
    cell.labelContent.text=_arrData[indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_arrData)
        return  [_arrData count];
    else
        return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SCREENH_HEIGHT/10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
            
        case 0:
        {
            RootNetWorkViewController *tempController=[[RootNetWorkViewController alloc]init];
            [self.navigationController pushViewController:tempController animated:YES];
        }
            break;
        case 1:
        {
            RootViewLayoutViewController *tempController=[[RootViewLayoutViewController alloc]init];
            [self.navigationController pushViewController:tempController animated:YES];
        }
            break;
        case 2:
        {
            RootMapViewController *tempController=[[RootMapViewController alloc]init];
            [self.navigationController pushViewController:tempController animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}

@end
