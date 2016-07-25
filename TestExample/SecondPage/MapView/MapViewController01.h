//
//  ViewController.h
//  TestMap
//
//  Created by OPS on 16/4/22.
//  Copyright © 2016年 OPS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MBProgressHUD.h"

static NSTimeInterval const kTimeDelay = 2.5;

@interface MapViewController01 : UIViewController

@property (strong , nonatomic)CLLocationManager *locationManager;
@property (strong , nonatomic)CLGeocoder * geocoder;

@property (strong, nonatomic) MBProgressHUD      *hud;

@property (weak, nonatomic) IBOutlet UITextView  *geoCoderResultLabel;
@property (weak, nonatomic) IBOutlet UITextView  *locationResultLabel;
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeField;

-(IBAction)loactionButtonPressed:(id)sender;

-(IBAction)geoCoderButtonPressed:(id)sender;

-(IBAction)reverseGeoCoderButtonPressed:(id)sender;

//-(IBAction)mapButtonPressed:(id)sender;

@end

