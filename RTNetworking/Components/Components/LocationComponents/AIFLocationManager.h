//
//  AJKHDLocationManager.h
//  AnjukeHD
//
//  Created by casa on 13-12-15.
//  Copyright (c) 2013年 Anjuke Inc. All rights reserved.
//

#import "RTAPIBaseManager.h"
#import "AIFCityListManager.h"
#import <CoreLocation/CoreLocation.h>

extern NSString * const AJKHDLocationManagerDidSuccessedLocateNotification;
extern NSString * const AJKHDLocationManagerDidFailedLocateNotification;
extern NSString * const AJKHDLocationManagerDidSwitchCityNotification;

typedef NS_ENUM(NSUInteger, AJKHDLocationManagerLocationResult) {
    AJKHDLocationManagerLocationResultDefault,              //默认状态
    AJKHDLocationManagerLocationResultLocating,             //定位中
    AJKHDLocationManagerLocationResultSuccess,              //定位成功
    AJKHDLocationManagerLocationResultFail,                 //定位失败
    AJKHDLocationManagerLocationResultParamsError,          //调用API的参数错了
    AJKHDLocationManagerLocationResultTimeout,              //超时
    AJKHDLocationManagerLocationResultNoNetwork,            //没有网络
    AJKHDLocationManagerLocationResultNoContent             //API没返回数据或返回数据是错的
};

typedef NS_ENUM(NSUInteger, AJKHDLocationManagerLocationServiceStatus) {
    AJKHDLocationManagerLocationServiceStatusDefault,               //默认状态
    AJKHDLocationManagerLocationServiceStatusOK,                    //定位功能正常
    AJKHDLocationManagerLocationServiceStatusUnknownError,          //未知错误
    AJKHDLocationManagerLocationServiceStatusUnAvailable,           //定位功能关掉了
    AJKHDLocationManagerLocationServiceStatusNoAuthorization,       //定位功能打开，但是用户不允许使用定位
    AJKHDLocationManagerLocationServiceStatusNoNetwork,             //没有网络
    AJKHDLocationManagerLocationServiceStatusNotDetermined          //用户还没做出是否要允许应用使用定位功能的决定，第一次安装应用的时候会提示用户做出是否允许使用定位功能的决定
};


@interface AIFLocationManager : RTAPIBaseManager <RTAPIManagerValidator, RTAPIManagerParamSourceDelegate, RTAPIManagerApiCallBackDelegate, CLLocationManagerDelegate>

@property (nonatomic, copy, readonly) NSString *selectedCityId;
@property (nonatomic, copy, readonly) NSString *selectedCityName;
@property (nonatomic, copy, readonly) CLLocation *selectedCityLocation;

@property (nonatomic, copy, readonly) NSString *locatedCityId;
@property (nonatomic, copy, readonly) NSString *locatedCityName;
@property (nonatomic, copy, readonly) CLLocation *locatedCityLocation;

@property (nonatomic, copy, readonly) NSString *currentCityId;
@property (nonatomic, copy, readonly) NSString *currentCityName;
@property (nonatomic, copy, readonly) CLLocation *currentCityLocation;

@property (nonatomic, readonly) BOOL isUsingLocatedData;

@property (nonatomic, readonly) AJKHDLocationManagerLocationResult locationResult;
@property (nonatomic, readonly) AJKHDLocationManagerLocationServiceStatus locationStatus;

@property (nonatomic, strong) AIFCityListManager *cityListManager;

+ (instancetype)sharedInstance;

- (BOOL)isInLocatedCity;
- (BOOL)isInLocatedCityWithLocation:(CLLocation *)location;

- (BOOL)checkLocationAndShowingAlert:(BOOL)showingAlert;

- (void)startLocation;
- (void)stopLocation;
- (void)restartLocation;

- (void)switchToCityWithCityId:(NSString *)cityId;
- (void)loadCurrentCityDataFromPlist;

@end
