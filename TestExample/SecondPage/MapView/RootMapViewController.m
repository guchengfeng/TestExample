//
//  ViewController.m
//  TestExample
//
//  Created by OPS on 16/7/20.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "RootMapViewController.h"
#import "mainTableViewCell.h"
#import "RootImageViewController.h"
#import "MapViewController01.h"
#import "MapViewController02.h"

@interface RootMapViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic)NSMutableArray *arrData;

@property (strong,nonatomic)UITableView *tableview;

@end

@interface RootMapViewController ()

@end

@implementation RootMapViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSURL *plistFile = [[NSBundle mainBundle] URLForResource:plist_API_Map_Item withExtension:@"plist"];
    _arrData = [[NSMutableArray alloc] initWithContentsOfURL:plistFile];
    [self.tableview reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
            MapViewController01 *tempController=[[MapViewController01 alloc]init];
            [self.navigationController pushViewController:tempController animated:YES];
        }
            break;
        case 1:
        {
            MapViewController02 *tempController=[[MapViewController02 alloc]init];
            [self.navigationController pushViewController:tempController animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}

@end
