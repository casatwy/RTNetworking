//
//  CTLocationManager.h
//  yili
//
//  Created by casa on 15/10/12.
//  Copyright © 2015年 Beauty Sight Network Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef NS_ENUM(NSUInteger, CTLocationManagerLocationServiceStatus) {
    CTLocationManagerLocationServiceStatusDefault,               //默认状态
    CTLocationManagerLocationServiceStatusOK,                    //定位功能正常
    CTLocationManagerLocationServiceStatusUnknownError,          //未知错误
    CTLocationManagerLocationServiceStatusUnAvailable,           //定位功能关掉了
    CTLocationManagerLocationServiceStatusNoAuthorization,       //定位功能打开，但是用户不允许使用定位
    CTLocationManagerLocationServiceStatusNoNetwork,             //没有网络
    CTLocationManagerLocationServiceStatusNotDetermined          //用户还没做出是否要允许应用使用定位功能的决定，第一次安装应用的时候会提示用户做出是否允许使用定位功能的决定
};

typedef NS_ENUM(NSUInteger, CTLocationManagerLocationResult) {
    CTLocationManagerLocationResultDefault,              //默认状态
    CTLocationManagerLocationResultLocating,             //定位中
    CTLocationManagerLocationResultSuccess,              //定位成功
    CTLocationManagerLocationResultFail,                 //定位失败
    CTLocationManagerLocationResultParamsError,          //调用API的参数错了
    CTLocationManagerLocationResultTimeout,              //超时
    CTLocationManagerLocationResultNoNetwork,            //没有网络
    CTLocationManagerLocationResultNoContent             //API没返回数据或返回数据是错的
};

@interface CTLocationManager : NSObject

@property (nonatomic, assign, readonly) CTLocationManagerLocationResult locationResult;
@property (nonatomic, assign,readonly) CTLocationManagerLocationServiceStatus locationStatus;
@property (nonatomic, copy, readonly) CLLocation *currentLocation;

+ (instancetype)sharedInstance;

- (void)startLocation;
- (void)stopLocation;
- (void)restartLocation;

@end
