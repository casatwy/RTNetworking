//
//  AXServiceFactory.m
//  RTNetworking
//
//  Created by casa on 14-5-12.
//  Copyright (c) 2014年 casatwy. All rights reserved.
//

#import "AIFServiceFactory.h"
#import "AIFService.h"

#import "GDMapService.h"

/*************************************************************************/

// service name list
NSString * const kAIFServiceGDMapV3 = @"kAIFServiceGDMapV3";


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
    if ([identifier isEqualToString:kAIFServiceGDMapV3]) {
        return [[GDMapService alloc] init];
    }
    
    return nil;
}

@end
