//
//  MapViewController.h
//  TestMap
//
//  Created by OPS on 16/4/22.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController02 : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

@property (strong , nonatomic)CLLocationManager *locationManager;

@property (strong, nonatomic) IBOutlet   MKMapView *mapView;

@property (strong, nonatomic) IBOutlet   UIView *viewHead;

@end
