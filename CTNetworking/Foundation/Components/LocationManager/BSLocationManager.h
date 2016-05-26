//
//  BSLocationManager.h
//  yili
//
//  Created by casa on 15/10/12.
//  Copyright © 2015年 Beauty Sight Network Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef NS_ENUM(NSUInteger, BSLocationManagerLocationServiceStatus) {
    BSLocationManagerLocationServiceStatusDefault,               //默认状态
    BSLocationManagerLocationServiceStatusOK,                    //定位功能正常
    BSLocationManagerLocationServiceStatusUnknownError,          //未知错误
    BSLocationManagerLocationServiceStatusUnAvailable,           //定位功能关掉了
    BSLocationManagerLocationServiceStatusNoAuthorization,       //定位功能打开，但是用户不允许使用定位
    BSLocationManagerLocationServiceStatusNoNetwork,             //没有网络
    BSLocationManagerLocationServiceStatusNotDetermined          //用户还没做出是否要允许应用使用定位功能的决定，第一次安装应用的时候会提示用户做出是否允许使用定位功能的决定
};

typedef NS_ENUM(NSUInteger, BSLocationManagerLocationResult) {
    BSLocationManagerLocationResultDefault,              //默认状态
    BSLocationManagerLocationResultLocating,             //定位中
    BSLocationManagerLocationResultSuccess,              //定位成功
    BSLocationManagerLocationResultFail,                 //定位失败
    BSLocationManagerLocationResultParamsError,          //调用API的参数错了
    BSLocationManagerLocationResultTimeout,              //超时
    BSLocationManagerLocationResultNoNetwork,            //没有网络
    BSLocationManagerLocationResultNoContent             //API没返回数据或返回数据是错的
};

@interface BSLocationManager : NSObject

@property (nonatomic, assign, readonly) BSLocationManagerLocationResult locationResult;
@property (nonatomic, assign,readonly) BSLocationManagerLocationServiceStatus locationStatus;
@property (nonatomic, copy, readonly) CLLocation *currentLocation;

+ (instancetype)sharedInstance;

- (void)startLocation;
- (void)stopLocation;
- (void)restartLocation;

@end
