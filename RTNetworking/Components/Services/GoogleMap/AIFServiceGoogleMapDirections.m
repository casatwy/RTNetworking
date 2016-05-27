//
//  AIFServiceGoogleMapDirections.m
//  RTNetworking
//
//  Created by casa on 14-5-25.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import "AIFServiceGoogleMapDirections.h"

@implementation AIFServiceGoogleMapDirections

#pragma mark - AIFServiceProtocal
- (BOOL)isOnline
{
    return YES;
}

- (NSString *)onlineApiBaseUrl
{
    return @"http://maps.googleapis.com/maps/api/";
}

- (NSString *)onlineApiVersion
{
    return @"directions/json";
}

- (NSString *)onlinePrivateKey
{
    return @"";
}

- (NSString *)onlinePublicKey
{
    return @"";
}

- (NSString *)offlineApiBaseUrl
{
    return self.onlineApiBaseUrl;
}

- (NSString *)offlineApiVersion
{
    return self.onlineApiVersion;
}

- (NSString *)offlinePrivateKey
{
    return self.onlinePrivateKey;
}

- (NSString *)offlinePublicKey
{
    return self.onlinePublicKey;
}

@end
