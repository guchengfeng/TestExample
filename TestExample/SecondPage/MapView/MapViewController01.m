//
//  ViewController.m
//  TestMap
//
//  Created by OPS on 16/4/22.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import "MapViewController01.h"

@interface MapViewController01 ()<CLLocationManagerDelegate>

@end

@implementation MapViewController01

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //定位管理器
    _locationManager=[[CLLocationManager alloc]init];
    
    _geocoder = [[CLGeocoder alloc] init];
    
    // 添加背景点击事件
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped)];
    recognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:recognizer];
    
    [self loactionButtonPressed:nil];
    
}

#pragma mark - CoreLocation 代理
#pragma mark 跟踪定位代理方法，每次位置发生变化即会执行（只要定位到相应位置）
//可以通过模拟器设置一个虚拟位置，否则在模拟器中无法调用此方法
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *location=[locations firstObject];//取出第一个位置
    CLLocationCoordinate2D coordinate=location.coordinate;//位置坐标
    NSLog(@"经度：%f,纬度：%f,海拔：%f,航向：%f,行走速度：%f",coordinate.longitude,coordinate.latitude,location.altitude,location.course,location.speed);
    NSString *formatString=[NSString stringWithFormat:@"经度：%f,纬度：%f,海拔：%f,航向：%f,行走速度：%f",coordinate.longitude,coordinate.latitude,location.altitude,location.course,location.speed];
    _locationResultLabel.text=formatString;
    
    
    
    //如果不需要实时定位，使用完即使关闭定位服务
    [_locationManager stopUpdatingLocation];
}

-(IBAction)loactionButtonPressed:(id)sender
{
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

-(IBAction)geoCoderButtonPressed:(id)sender
{
    if (self.addressField.text.length == 0) {
        [self showCommonTip:@"请填写地址"];
        return;
    }
    
    [self showProcessHud:@"正在获取位置信息"];
    
    [self.geocoder geocodeAddressString:self.addressField.text completionHandler:^(NSArray *placemarks, NSError *error) {
        [_hud hide:YES];
        
        if (error) {
            [self showCommonTip:@"地理编码出错，或许你选的地方在冥王星"];
            NSLog(@"%@", error);
            return;
        }
        
        CLPlacemark *placemark = [placemarks firstObject];
        NSString *formatString = [NSString stringWithFormat:@"经度：%lf，纬度：%lf\n%@ %@ %@\n%@\n%@ %@", placemark.location.coordinate.latitude, placemark.location.coordinate.longitude, placemark.addressDictionary[@"City"], placemark.addressDictionary[@"Country"], placemark.addressDictionary[@"CountryCode"], [placemark.addressDictionary[@"FormattedAddressLines"] firstObject], placemark.addressDictionary[@"Name"], placemark.addressDictionary[@"State"]];
        _geoCoderResultLabel.text = formatString;
        [self keyboardResign];
      
        
        for (CLPlacemark *pm in placemarks) {
            NSLog(@"经度：%lf，纬度：%lf\n%@ %@ %@\n%@\n%@ %@", pm.location.coordinate.latitude, pm.location.coordinate.longitude, pm.addressDictionary[@"City"], pm.addressDictionary[@"Country"], pm.addressDictionary[@"CountryCode"], [pm.addressDictionary[@"FormattedAddressLines"] firstObject], pm.addressDictionary[@"Name"], pm.addressDictionary[@"State"]);
        }
    }];
}

-(IBAction)reverseGeoCoderButtonPressed:(id)sender
{
    
    if (self.latitudeField.text.length == 0 || self.longitudeField.text.length == 0) {
        [self showCommonTip:@"请填写经纬度"];
        return;
    }
    
    [self showProcessHud:@"正在获取位置信息"];
    
    CLLocationDegrees latitude = [self.latitudeField.text doubleValue];
    CLLocationDegrees longitude = [self.longitudeField.text doubleValue];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        [_hud hide:YES];
        
        if (error) {
            [self showCommonTip:@"地理编码出错，或许你选的地方在冥王星"];
            NSLog(@"%@", error);
            return;
        }
        
        CLPlacemark *placemark = [placemarks firstObject];
        NSString *formatString = [NSString stringWithFormat:@"经度：%lf，纬度：%lf\n%@ %@ %@\n%@\n%@ %@", placemark.location.coordinate.latitude, placemark.location.coordinate.longitude, placemark.addressDictionary[@"City"], placemark.addressDictionary[@"Country"], placemark.addressDictionary[@"CountryCode"], [placemark.addressDictionary[@"FormattedAddressLines"] firstObject], placemark.addressDictionary[@"Name"], placemark.addressDictionary[@"State"]];
        _geoCoderResultLabel.text = formatString;
        [self keyboardResign];
        
        for (CLPlacemark *pm in placemarks) {
            NSLog(@"经度：%lf，纬度：%lf\n%@ %@ %@\n%@\n%@ %@", pm.location.coordinate.latitude, pm.location.coordinate.longitude, pm.addressDictionary[@"City"], pm.addressDictionary[@"Country"], pm.addressDictionary[@"CountryCode"], [pm.addressDictionary[@"FormattedAddressLines"] firstObject], pm.addressDictionary[@"Name"], pm.addressDictionary[@"State"]);
        }
    }];
}

#pragma mark 根据地名确定地理坐标
-(void)getCoordinateByAddress:(NSString *)address{
    //地理编码
    [_geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        //取得第一个地标，地标中存储了详细的地址信息，注意：一个地名可能搜索出多个地址
        CLPlacemark *placemark=[placemarks firstObject];
        
        CLLocation *location=placemark.location;//位置
        CLRegion *region=placemark.region;//区域
        NSDictionary *addressDic= placemark.addressDictionary;//详细地址信息字典,包含以下部分信息
        //        NSString *name=placemark.name;//地名
        //        NSString *thoroughfare=placemark.thoroughfare;//街道
        //        NSString *subThoroughfare=placemark.subThoroughfare; //街道相关信息，例如门牌等
        //        NSString *locality=placemark.locality; // 城市
        //        NSString *subLocality=placemark.subLocality; // 城市相关信息，例如标志性建筑
        //        NSString *administrativeArea=placemark.administrativeArea; // 州
        //        NSString *subAdministrativeArea=placemark.subAdministrativeArea; //其他行政区域信息
        //        NSString *postalCode=placemark.postalCode; //邮编
        //        NSString *ISOcountryCode=placemark.ISOcountryCode; //国家编码
        //        NSString *country=placemark.country; //国家
        //        NSString *inlandWater=placemark.inlandWater; //水源、湖泊
        //        NSString *ocean=placemark.ocean; // 海洋
        //        NSArray *areasOfInterest=placemark.areasOfInterest; //关联的或利益相关的地标
        NSLog(@"位置:%@,区域:%@,详细信息:%@",location,region,addressDic);
    }];
}

#pragma mark - Private

- (void)showCommonTip:(NSString *)tip {
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeText;
    self.hud.labelText = tip;
    self.hud.removeFromSuperViewOnHide = YES;
    [_hud hide:YES afterDelay:kTimeDelay];
}

- (void)showProcessHud:(NSString *)msg {
    self.hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view  addSubview:self.hud];
    self.hud.removeFromSuperViewOnHide = YES;
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.labelText = msg;
    [self.hud show:NO];
}

- (void)backgroundTapped {
    [self keyboardResign];
}


- (void)keyboardResign {
    [self.view endEditing:YES];
}


@end
