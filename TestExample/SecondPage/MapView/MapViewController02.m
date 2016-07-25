//
//  MapViewController.m
//  TestMap
//
//  Created by OPS on 16/4/22.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "MapViewController02.h"

@interface MapViewController02 ()

@end

@implementation MapViewController02

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _mapView = [[MKMapView alloc]init];
    _mapView.delegate=self;
    _mapView.frame=CGRectMake(0, _viewHead.frame.origin.y+_viewHead.frame.size.height+5, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-50);
    [self.view addSubview:_mapView];
    _mapView.userTrackingMode=MKUserTrackingModeFollow;
//    _mapView.mapType=MKMapTypeStandard;
//    _mapView.showsUserLocation=YES;
//    _mapView.zoomEnabled=YES;
    
    
    //定位管理器
    _locationManager=[[CLLocationManager alloc]init];
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位服务当前可能尚未打开，请设置打开！");
        return;
    }
    
    //如果没有授权则请求用户授权
    if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusNotDetermined){
        [_locationManager requestWhenInUseAuthorization];
    }else if([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedWhenInUse){
        //设置代理
        _locationManager.delegate=self;
        //设置定位精度
        _locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        //定位频率,每隔多少米定位一次
        CLLocationDistance distance=10.0;//十米定位一次
        _locationManager.distanceFilter=distance;
        //启动跟踪定位
        [_locationManager startUpdatingLocation];
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CoreLocation 代理
#pragma mark 跟踪定位代理方法，每次位置发生变化即会执行（只要定位到相应位置）
//可以通过模拟器设置一个虚拟位置，否则在模拟器中无法调用此方法
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *location=[locations firstObject];//取出第一个位置
    CLLocationCoordinate2D coordinate=location.coordinate;//位置坐标
    NSLog(@"经度：%f,纬度：%f,海拔：%f,航向：%f,行走速度：%f",coordinate.longitude,coordinate.latitude,location.altitude,location.course,location.speed);
//    NSString *formatString=[NSString stringWithFormat:@"经度：%f,纬度：%f,海拔：%f,航向：%f,行走速度：%f",coordinate.longitude,coordinate.latitude,location.altitude,location.course,location.speed];
    
    
    [self showInMapWithCoordinate:coordinate];
    
    
    //如果不需要实时定位，使用完即使关闭定位服务
    [_locationManager stopUpdatingLocation];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/**
 *  将位置信息显示到mapView上
 */
- (void)showInMapWithCoordinate:(CLLocationCoordinate2D)coordinate {
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, MKCoordinateSpanMake(0.005, 0.005));
    [self.mapView setRegion:region animated:YES];
    [self addAnnotation:coordinate];
}

/**
 *  添加大头针
 */
- (void)addAnnotation:(CLLocationCoordinate2D)coordinate {
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.title = @"北京市朝阳区广顺北大街33号院1号楼福码大厦B座12层";
    annotation.coordinate = coordinate;
    [self.mapView addAnnotation:annotation];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
}

@end
