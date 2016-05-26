//
//  AXRuntimeInfomation.h
//  RTNetworking
//
//  Created by casa on 14-5-6.
//  Copyright (c) 2014年 casatwy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIFNetworkingConfiguration.h"
#import "RTAPIBaseManager.h"

@interface AIFAppContext : NSObject

//凡是未声明成readonly的都是需要在初始化的时候由外面给的

// 设备信息
@property (nonatomic, copy, readonly) NSString *type;
@property (nonatomic, copy, readonly) NSString *model;
@property (nonatomic, copy, readonly) NSString *os;
@property (nonatomic, copy, readonly) NSString *rom;
@property (nonatomic, copy, readonly) NSString *ppi;
@property (nonatomic, copy, readonly) NSString *imei;
@property (nonatomic, copy, readonly) NSString *imsi;
@property (nonatomic, copy, readonly) NSString *deviceName;
@property (nonatomic, assign, readonly) CGSize resolution;

// 运行环境相关
@property (nonatomic, assign, readonly) BOOL isReachable;
@property (nonatomic, assign, readonly) BOOL isOnline;
@property (nonatomic, assign) BOOL isBackendMode;

// 用户token相关
@property (nonatomic, copy, readonly) NSString *accessToken;
@property (nonatomic, copy, readonly) NSString *refreshToken;
@property (nonatomic, assign, readonly) NSTimeInterval lastRefreshTime;

// 用户信息
@property (nonatomic, copy) NSDictionary *userInfo;
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, readonly) BOOL isLoggedIn;
@property (nonatomic, assign) BOOL userHasFollowings;

// app信息
@property (nonatomic, copy, readonly) NSString *sessionId; // 每次启动App时都会新生成
@property (nonatomic, readonly) NSString *appVersion;

// 推送相关
@property (nonatomic, copy) NSData *deviceTokenData;
@property (nonatomic, copy) NSString *deviceToken;
@property (nonatomic, strong) RTAPIBaseManager *updateTokenAPIManager;

// 地理位置
@property (nonatomic, assign, readonly) CGFloat latitude;
@property (nonatomic, assign, readonly) CGFloat longitude;

// 微信数据
@property (nonatomic, copy) NSString *wxAppID;
@property (nonatomic, copy) NSString *wxSecret;
@property (nonatomic, assign) BOOL isWxInstalled;
@property (nonatomic, assign) BOOL isQQInstalled;

// 用户配置
@property (nonatomic, assign) BOOL shouldPlayVideoOnlyInWifi;
@property (nonatomic, assign, readonly) BOOL isWifi;

@property (nonatomic, assign) BOOL isDefaultLayoutSaved;
@property (nonatomic, assign) BOOL isTileLayout;

+ (instancetype)sharedInstance;

- (void)updateAccessToken:(NSString *)accessToken refreshToken:(NSString *)refreshToken;
- (void)cleanUserInfo;

- (void)appStarted;
- (void)appEnded;

@end
