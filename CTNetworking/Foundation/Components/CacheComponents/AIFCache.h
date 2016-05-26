//
//  AIFCache.h
//  RTNetworking
//
//  Created by casa on 14-5-26.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIFCachedObject.h"

@interface AIFCache : NSObject

+ (instancetype)sharedInstance;

- (NSString *)keyWithServiceIdentifier:(NSString *)serviceIdentifier
                                    methodName:(NSString *)methodName
                                 requestParams:(NSDictionary *)requestParams;



- (NSData *)fetchCachedDataWithServiceIdentifier:(NSString *)serviceIdentifier
                                methodName:(NSString *)methodName
                             requestParams:(NSDictionary *)requestParams;

- (void)saveCacheWithData:(NSData *)cachedData
        serviceIdentifier:(NSString *)serviceIdentifier
               methodName:(NSString *)methodName
            requestParams:(NSDictionary *)requestParams;

- (void)deleteCacheWithServiceIdentifier:(NSString *)serviceIdentifier
                              methodName:(NSString *)methodName
                           requestParams:(NSDictionary *)requestParams;



- (NSData *)fetchCachedDataWithKey:(NSString *)key;
- (void)saveCacheWithData:(NSData *)cachedData key:(NSString *)key;
- (void)deleteCacheWithKey:(NSString *)key;
- (void)clean;

@end
