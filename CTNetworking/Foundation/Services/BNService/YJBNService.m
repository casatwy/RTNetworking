//
//  YJBNService.m
//  CTNetworking
//
//  Created by LongFan on 16/5/10.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "YJBNService.h"
#import "AIFAppContext.h"

@implementation YJBNService

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
    return @"backend";
}

- (NSString *)onlineApiVersion
{
    return @"backend";
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
