//
//  BSLocationManager.m
//  yili
//
//  Created by casa on 15/10/12.
//  Copyright © 2015年 Beauty Sight Network Technology Co.,Ltd. All rights reserved.
//

#import "BSLocationManager.h"

@interface BSLocationManager () <CLLocationManagerDelegate>

@property (nonatomic, assign, readwrite) BSLocationManagerLocationResult locationResult;
@property (nonatomic, assign, readwrite) BSLocationManagerLocationServiceStatus locationStatus;
@property (nonatomic, copy, readwrite) CLLocation *currentLocation;

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation BSLocationManager

+ (instancetype)sharedInstance
{
    static BSLocationManager *locationManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        locationManager = [[BSLocationManager alloc] init];
    });
    return locationManager;
}

- (void)startLocation
{
    if ([self checkLocationStatus]) {
        self.locationResult = BSLocationManagerLocationResultLocating;
        [self.locationManager startUpdatingLocation];
    } else {
        [self failedLocationWithResultType:BSLocationManagerLocationResultFail statusType:self.locationStatus];
    }
}

- (void)stopLocation
{
    if ([self checkLocationStatus]) {
        [self.locationManager stopUpdatingLocation];
    }
}

- (void)restartLocation
{
    [self stopLocation];
    [self startLocation];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.currentLocation = [manager.location copy];
    NSLog(@"Current location is %@", self.currentLocation);
    [self stopLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    //如果用户还没选择是否允许定位，则不认为是定位失败
    if (self.locationStatus == BSLocationManagerLocationServiceStatusNotDetermined) {
        return;
    }
    
    //如果正在定位中，那么也不会通知到外面
    if (self.locationResult == BSLocationManagerLocationResultLocating) {
        return;
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        self.locationStatus = BSLocationManagerLocationServiceStatusOK;
        [self restartLocation];
    } else {
        if (self.locationStatus != BSLocationManagerLocationServiceStatusNotDetermined) {
            [self failedLocationWithResultType:BSLocationManagerLocationResultDefault statusType:BSLocationManagerLocationServiceStatusNoAuthorization];
        } else {
            [self.locationManager requestWhenInUseAuthorization];
            [self.locationManager startUpdatingLocation];
        }
    }
}

#pragma mark - private methods
- (void)failedLocationWithResultType:(BSLocationManagerLocationResult)result statusType:(BSLocationManagerLocationServiceStatus)status
{
    self.locationResult = result;
    self.locationStatus = status;
}

- (BOOL)checkLocationStatus;
{
    BOOL result = NO;
    BOOL serviceEnable = [self locationServiceEnabled];
    BSLocationManagerLocationServiceStatus authorizationStatus = [self locationServiceStatus];
    if (authorizationStatus == BSLocationManagerLocationServiceStatusOK && serviceEnable) {
        result = YES;
    }else if (authorizationStatus == BSLocationManagerLocationServiceStatusNotDetermined) {
        result = YES;
    }else{
        result = NO;
    }
    
    if (serviceEnable && result) {
        result = YES;
    }else{
        result = NO;
    }
    
    if (result == NO) {
        [self failedLocationWithResultType:BSLocationManagerLocationResultFail statusType:self.locationStatus];
    }
    
    return result;
}

- (BOOL)locationServiceEnabled
{
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationStatus = BSLocationManagerLocationServiceStatusOK;
        return YES;
    } else {
        self.locationStatus = BSLocationManagerLocationServiceStatusUnknownError;
        return NO;
    }
}

- (BSLocationManagerLocationServiceStatus)locationServiceStatus
{
    self.locationStatus = BSLocationManagerLocationServiceStatusUnknownError;
    BOOL serviceEnable = [CLLocationManager locationServicesEnabled];
    if (serviceEnable) {
        CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
        switch (authorizationStatus) {
            case kCLAuthorizationStatusNotDetermined:
                self.locationStatus = BSLocationManagerLocationServiceStatusNotDetermined;
                break;
                
            case kCLAuthorizationStatusAuthorizedAlways :
            case kCLAuthorizationStatusAuthorizedWhenInUse:
                self.locationStatus = BSLocationManagerLocationServiceStatusOK;
                break;
                
            case kCLAuthorizationStatusDenied:
                self.locationStatus = BSLocationManagerLocationServiceStatusNoAuthorization;
                break;
                
            default:
                break;
        }
    } else {
        self.locationStatus = BSLocationManagerLocationServiceStatusUnAvailable;
    }
    return self.locationStatus;
}

#pragma mark - getters and setters
- (CLLocationManager *)locationManager
{
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return _locationManager;
}

@end
