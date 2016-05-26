//
//  BSLogService.m
//  yili
//
//  Created by casa on 15/10/13.
//  Copyright © 2015年 Beauty Sight Network Technology Co.,Ltd. All rights reserved.
//

#import "BSLogService.h"
#import "AIFAppContext.h"

@implementation BSLogService

#pragma mark - AIFServiceProtocal
- (BOOL)isOnline
{
    return [AIFAppContext sharedInstance].isOnline;
}

- (NSString *)offlineApiBaseUrl
{
    return @"https://test.logs.playplus.me";
}

- (NSString *)onlineApiBaseUrl
{
    return @"https://logs.playplus.me";
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
    return @"33d5cd60f7cba7454a5272c15247527af3e89b3820b442c0c89a03abe7bb44ff";
}

- (NSString *)offlinePrivateKey
{
    return @"4613674078a1674512947b825714db1881d20113df32b53925f05d5ba97968ba";
}

@end
