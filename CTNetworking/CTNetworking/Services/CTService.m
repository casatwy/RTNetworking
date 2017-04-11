//
//  AXService.m
//  RTNetworking
//
//  Created by casa on 14-5-15.
//  Copyright (c) 2014年 casatwy. All rights reserved.
//

#import "CTService.h"
#import "NSObject+CTNetworkingMethods.h"

@interface CTService()

@property (nonatomic, weak, readwrite) id<CTServiceProtocol> child;

@end

@implementation CTService

- (instancetype)init
{
    self = [super init];
    if (self) {
        if ([self conformsToProtocol:@protocol(CTServiceProtocol)]) {
            self.child = (id<CTServiceProtocol>)self;
        }
    }
    return self;
}

- (NSString *)urlGeneratingRuleByMethodName:(NSString *)methodName {
    NSString *urlString = nil;
    if (self.apiVersion.length != 0) {
        urlString = [NSString stringWithFormat:@"%@/%@/%@", self.apiBaseUrl, self.apiVersion, methodName];
    } else {
        urlString = [NSString stringWithFormat:@"%@/%@", self.apiBaseUrl, methodName];
    }
    return urlString;
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
