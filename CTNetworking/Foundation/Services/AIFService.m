//
//  AXService.m
//  RTNetworking
//
//  Created by casa on 14-5-15.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import "AIFService.h"
#import "NSObject+AXNetworkingMethods.h"

@implementation AIFService

- (instancetype)init
{
    self = [super init];
    if (self) {
        if ([self conformsToProtocol:@protocol(AIFServiceProtocal)]) {
            self.child = (id<AIFServiceProtocal>)self;
        }
    }
    return self;
}

#pragma mark - getters and setters
- (NSString *)privateKey
{
    return self.child.isOnline ? self.child.onlinePrivateKey : self.child.offlinePrivateKey;
}

- (NSString *)publicKey
{
    return self.child.isOnline ? self.child.onlinePublicKey : self.child.offlinePublicKey;
}

- (NSString *)apiBaseUrl
{
    return self.child.isOnline ? self.child.onlineApiBaseUrl : self.child.offlineApiBaseUrl;
}

- (NSString *)apiVersion
{
    return self.child.isOnline ? self.child.onlineApiVersion : self.child.offlineApiVersion;
}

@end
