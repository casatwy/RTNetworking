//
//  GDMapService.m
//  CTNetworking
//
//  Created by casa on 16/4/12.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "GDMapService.h"
#import "CTAppContext.h"

@implementation GDMapService

#pragma mark - CTServiceProtocal
- (BOOL)isOnline
{
    return [CTAppContext sharedInstance].isOnline;
}

- (NSString *)offlineApiBaseUrl
{
    return @"http://restapi.amap.com";
}

- (NSString *)onlineApiBaseUrl
{
    return @"http://restapi.amap.com";
}

- (NSString *)offlineApiVersion
{
    return @"v3";
}

- (NSString *)onlineApiVersion
{
    return @"v3";
}

- (NSString *)onlinePublicKey
{
    return @"384ecc4559ffc3b9ed1f81076c5f8424";
}

- (NSString *)offlinePublicKey
{
    return @"384ecc4559ffc3b9ed1f81076c5f8424";
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
