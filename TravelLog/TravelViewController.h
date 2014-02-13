//
//  TravelViewController.h
//  TravelLog
//
//  Created by ami on 2014/02/12.
//  Copyright (c) 2014年 Yosuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface TravelViewController : UIViewController<GMSMapViewDelegate>

@property GMSMapView *mapView;

@end
