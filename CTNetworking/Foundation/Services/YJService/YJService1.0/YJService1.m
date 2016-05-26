//
//  YJService1.m
//  CTNetworking
//
//  Created by casa on 16/3/22.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "YJService1.h"
#import "AIFAppContext.h"

@implementation YJService1

#pragma mark - AIFServiceProtocal
- (BOOL)isOnline
{
    return [AIFAppContext sharedInstance].isOnline;
}

- (NSString *)offlineApiBaseUrl
{
    return @"https://test.api.yj.playplus.me";
}

- (NSString *)onlineApiBaseUrl
{
    return @"https://api.yj.playplus.me";
}

- (NSString *)offlineApiVersion
{
    return @"v1.0";
}

- (NSString *)onlineApiVersion
{
    return @"v1.0";
}

- (NSString *)onlinePublicKey
{
    return @"";
}

- (NSString *)offlinePublicKey
{
    return @"";
}

- (NSString *)onlinePrivateKey
{
    return @"";
}

- (NSString *)offlinePrivateKey
{
    return @"";
}

@end
