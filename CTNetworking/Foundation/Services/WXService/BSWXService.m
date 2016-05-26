//
//  BSWXService.m
//  yili
//
//  Created by LongFan on 15/8/24.
//  Copyright (c) 2015年 casa. All rights reserved.
//

#import "BSWXService.h"
#import "AIFAppContext.h"

@implementation BSWXService

#pragma mark - AIFServiceProtocal
- (BOOL)isOnline
{
    return [AIFAppContext sharedInstance].isOnline;
}

- (NSString *)offlineApiBaseUrl
{
    return @"https://api.weixin.qq.com/sns";
}

- (NSString *)offlineApiVersion
{
    return @"";
}

- (NSString *)offlinePublicKey
{
    return @"";
}

- (NSString *)offlinePrivateKey
{
    return @"";
}

- (NSString *)onlineApiBaseUrl
{
    return @"https://api.weixin.qq.com/sns";
}

- (NSString *)onlineApiVersion
{
    return @"";
}

- (NSString *)onlinePublicKey
{
    return @"";
}

- (NSString *)onlinePrivateKey
{
    return @"";
}

@end
