//
//  AXServiceFactory.m
//  RTNetworking
//
//  Created by casa on 14-5-12.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import "AIFServiceFactory.h"
#import "AIFService.h"

#import "BSWXService.h"
#import "BSLogService.h"
#import "GDMapService.h"
#import "YJBNService.h"
#import "INSService.h"

#import "YJService1.h"

/*************************************************************************/

// service name list
NSString * const kAIFServiceYJ_1_0 = @"kAIFServiceYJ_1_0";
NSString * const kAIFServiceWeixin = @"kAIFServiceWeixin";
NSString * const kAIFServiceBeautifulShareLog = @"kAIFServiceBeautifulShareLog";
NSString * const kAIFServiceGDMapV3 = @"kAIFServiceGDMapV3";
NSString * const kAIFServiceYJBN = @"kAIFServiceYJBN";
NSString * const kAIFServiceInstgram = @"kAIFServiceInstgram";


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
    if ([identifier isEqualToString:kAIFServiceYJ_1_0]) {
        return [[YJService1 alloc] init];
    }
    
    if ([identifier isEqualToString:kAIFServiceWeixin]) {
        return [[BSWXService alloc] init];
    }
    
    if ([identifier isEqualToString:kAIFServiceBeautifulShareLog]) {
        return [[BSLogService alloc] init];
    }
    
    if ([identifier isEqualToString:kAIFServiceGDMapV3]) {
        return [[GDMapService alloc] init];
    }
    
    if ([identifier isEqualToString:kAIFServiceYJBN]) {
        return [[YJBNService alloc] init];
    }
    
    if ([identifier isEqualToString:kAIFServiceInstgram]) {
        return [[INSService alloc] init];
    }
    
    return nil;
}

@end
