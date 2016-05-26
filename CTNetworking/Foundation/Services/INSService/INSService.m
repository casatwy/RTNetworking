//
//  INSService.m
//  CTNetworking
//
//  Created by LongFan on 16/5/16.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "INSService.h"
#import "AIFAppContext.h"

@implementation INSService

#pragma mark - AIFServiceProtocal
- (BOOL)isOnline
{
    return [AIFAppContext sharedInstance].isOnline;
}

- (NSString *)offlineApiBaseUrl
{
    return @"https://api.instagram.com";
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
    return @"https://api.instagram.com";
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
