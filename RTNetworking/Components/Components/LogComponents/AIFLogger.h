//
//  AXLogger.h
//  RTNetworking
//
//  Created by casa on 14-5-6.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIFService.h"
#import "AIFLoggerConfiguration.h"
#import "AIFURLResponse.h"


@interface AIFLogger : NSObject

@property (nonatomic, strong, readonly) AIFLoggerConfiguration *configParams;

+ (void)logDebugInfoWithRequest:(NSURLRequest *)request apiName:(NSString *)apiName service:(AIFService *)service requestParams:(id)requestParams httpMethod:(NSString *)httpMethod;
+ (void)logDebugInfoWithResponse:(NSHTTPURLResponse *)response resposeString:(NSString *)responseString request:(NSURLRequest *)request error:(NSError *)error;
+ (void)logDebugInfoWithCachedResponse:(AIFURLResponse *)response methodName:(NSString *)methodName serviceIdentifier:(AIFService *)service;

+ (instancetype)sharedInstance;
- (void)logWithActionCode:(NSString *)actionCode params:(NSDictionary *)params;

@end
