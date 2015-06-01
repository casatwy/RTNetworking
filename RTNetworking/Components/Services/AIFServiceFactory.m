//
//  AXServiceFactory.m
//  RTNetworking
//
//  Created by casa on 14-5-12.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import "AIFServiceFactory.h"
#import "AIFService.h"

// anjuke
#import "AIFServiceAnjuke.h"
#import "AIFServiceAnjukeREST_4.h"
#import "AIFServiceAnjukeCorp.h"
#import "AIFServiceAnjukeRest.h"
#import "AIFServiceAnjukeV5.h"

// x
#import "AIFServiceXRest.h"
#import "AIFServiceXAudioRest.h"
#import "AIFServiceXPublicRest.h"
#import "AIFServiceXUnread.h"

// broker
#import "AIFServiceBrokerRest.h"
#import "AIFServiceBrokerCorp.h"
#import "AIFServiceBroker.h"

// haozu
#import "AIFServiceHaozu.h"
#import "AIFServiceHaozuCorp.h"

// xinfang
#import "AIFServiceXinfang.h"

// jinpu
#import "AIFServiceJinpuRest.h"

// other
#import "AIFServiceCoordinatorChannel.h"
#import "AIFServiceMarket.h"
#import "AIFServiceMember.h"
#import "AIFServiceNotification.h"
#import "AIFServiceTrace.h"
#import "AIFServiceURLChange.h"

// Google Map API
#import "AIFServiceGoogleMapDirections.h"

/*************************************************************************/

// anjuke
NSString * const kAIFServiceAnjuke = @"kAXServiceAnjuke";
NSString * const kAIFServiceAnjukeREST_4 = @"kAXServiceAnjukeREST_4";
NSString * const kAIFServiceAnjukeCorp = @"kAXServiceAnjukeCorp";
NSString * const kAIFServiceAnjukeRest = @"kAIFServiceAnjukeRest";
NSString * const kAIFServiceAnjukeV5 = @"kAIFServiceAnjukeV5";

// x
NSString * const kAIFServiceXRest = @"kAIFServiceXRest";
NSString * const kAIFServiceXAudioRest = @"kAIFServiceXAudioRest";
NSString * const kAIFServiceXPublicRest = @"kAIFServiceXPublicRest";
NSString * const kAIFServiceXUnread = @"kAIFServiceXUnread";

// broker
NSString * const kAIFServiceBrokerRest = @"kAIFServiceBrokerRest";
NSString * const kAIFServiceBrokerCorp = @"kAIFServiceBrokerCorp";
NSString * const kAIFServiceBroker = @"kAIFServiceBroker";

// haozu
NSString * const kAIFServiceHaozu = @"kAIFServiceHaozu";
NSString * const kAIFServiceHaozuCorp = @"kAIFServiceHaozuCorp";

// xinfang
NSString * const kAIFServiceXinfang = @"kAIFServiceXinfang";

// jinpu
NSString * const kAIFServiceJinpuRest = @"kAIFServiceJinpuRest";

// other
NSString * const kAIFServiceCoordinatorChannel = @"kAIFServiceCoordinatorChannel";
NSString * const kAIFServiceMarket = @"kAIFServiceMarket";
NSString * const kAIFServiceMember = @"kAIFServiceMember";
NSString * const kAIFServiceNotification = @"kAIFServiceNotification";
NSString * const kAIFServiceTrace = @"kAIFServiceTrace";
NSString * const kAIFServiceURLChange = @"kAIFServiceURLChange";

// Google Map API
NSString * const kAIFServiceGoogleMapAPIDirections = @"kAIFServiceGoogleMapAPIDirections";


@interface AIFServiceFactory ()

@property (nonatomic, strong) NSMutableDictionary *serviceStorage;

@end

@implementation AIFServiceFactory

#pragma mark - getters and setters
- (NSMutableDictionary *)serviceStorage
{
    if (_serviceStorage == nil) {
        _serviceStorage = [[NSMutableDictionary alloc] init];
    }
    return _serviceStorage;
}

#pragma mark - life cycle
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static AIFServiceFactory *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AIFServiceFactory alloc] init];
    });
    return sharedInstance;
}

#pragma mark - public methods
- (AIFService<AIFServiceProtocal> *)serviceWithIdentifier:(NSString *)identifier
{
    if (self.serviceStorage[identifier] == nil) {
        self.serviceStorage[identifier] = [self newServiceWithIdentifier:identifier];
    }
    return self.serviceStorage[identifier];
}

#pragma mark - private methods
- (AIFService<AIFServiceProtocal> *)newServiceWithIdentifier:(NSString *)identifier
{
    // anjuke
    if ([identifier isEqualToString:kAIFServiceAnjuke]) {
        return [[AIFServiceAnjuke alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceAnjukeREST_4]) {
        return [[AIFServiceAnjukeREST_4 alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceAnjukeCorp]) {
        return [[AIFServiceAnjukeCorp alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceAnjukeRest]) {
        return [[AIFServiceAnjukeRest alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceAnjukeV5]) {
        return [[AIFServiceAnjukeV5 alloc] init];
    }
    
    // x
    if ([identifier isEqualToString:kAIFServiceXRest]) {
        return [[AIFServiceXRest alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceXAudioRest]) {
        return [[AIFServiceXAudioRest alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceXPublicRest]) {
        return [[AIFServiceXPublicRest alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceXUnread]) {
        return [[AIFServiceXUnread alloc] init];
    }
    
    // broker
    if ([identifier isEqualToString:kAIFServiceBrokerRest]) {
        return [[AIFServiceBrokerRest alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceBrokerCorp]) {
        return [[AIFServiceBrokerCorp alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceBroker]) {
        return [[AIFServiceBroker alloc] init];
    }
    
    // haozu
    if ([identifier isEqualToString:kAIFServiceHaozu]) {
        return [[AIFServiceHaozu alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceHaozuCorp]) {
        return [[AIFServiceHaozuCorp alloc] init];
    }
    
    // xinfang
    if ([identifier isEqualToString:kAIFServiceXinfang]) {
        return [[AIFServiceXinfang alloc] init];
    }
    
    // jinpu
    if ([identifier isEqualToString:kAIFServiceJinpuRest]) {
        return [[AIFServiceJinpuRest alloc] init];
    }
    
    // other
    if ([identifier isEqualToString:kAIFServiceCoordinatorChannel]) {
        return [[AIFServiceCoordinatorChannel alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceMarket]) {
        return [[AIFServiceMarket alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceMember]) {
        return [[AIFServiceMember alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceNotification]) {
        return [[AIFServiceNotification alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceTrace]) {
        return [[AIFServiceTrace alloc] init];
    }
    if ([identifier isEqualToString:kAIFServiceURLChange]) {
        return [[AIFServiceURLChange alloc] init];
    }
    
    // Google Map API
    if ([identifier isEqualToString:kAIFServiceGoogleMapAPIDirections]) {
        return [[AIFServiceGoogleMapDirections alloc] init];
    }
    
    return nil;
}

@end
