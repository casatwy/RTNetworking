//
//  CTNetworkingConfigurationManager.m
//  CTNetworking
//
//  Created by Corotata on 2017/4/10.
//  Copyright © 2017年 Long Fan. All rights reserved.
//

#import "CTNetworkingConfigurationManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation CTNetworkingConfigurationManager

+ (instancetype)sharedInstance
{
    static CTNetworkingConfigurationManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CTNetworkingConfigurationManager alloc] init];
        sharedInstance.shouldCache = YES;
        sharedInstance.serviceIsOnline = NO;
        sharedInstance.apiNetworkingTimeoutSeconds = 20.0f;
        sharedInstance.cacheOutdateTimeSeconds = 300;
        sharedInstance.cacheCountLimit = 1000;
        sharedInstance.shouldSetParamsInHTTPBodyButGET = NO;
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    });
    return sharedInstance;
}

- (BOOL)isReachable
{
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusUnknown) {
        return YES;
    } else {
        return [[AFNetworkReachabilityManager sharedManager] isReachable];
    }
}


@end
