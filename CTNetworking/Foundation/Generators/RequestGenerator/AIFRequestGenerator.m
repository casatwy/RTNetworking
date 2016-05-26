//
//  AXRequestGenerator.m
//  RTNetworking
//
//  Created by casa on 14-5-14.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import "AIFRequestGenerator.h"
#import "AIFSignatureGenerator.h"
#import "AIFServiceFactory.h"
#import "AIFCommonParamsGenerator.h"
#import "NSDictionary+AXNetworkingMethods.h"
#import "AIFNetworkingConfiguration.h"
#import "NSObject+AXNetworkingMethods.h"
#import <AFNetworking/AFNetworking.h>
#import "AIFService.h"
#import "NSObject+AXNetworkingMethods.h"
#import "AIFLogger.h"
#import "NSURLRequest+AIFNetworkingMethods.h"

@interface AIFRequestGenerator ()

@property (nonatomic, strong) AFHTTPRequestSerializer *httpRequestSerializer;

@end

@implementation AIFRequestGenerator
#pragma mark - public methods
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static AIFRequestGenerator *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AIFRequestGenerator alloc] init];
    });
    return sharedInstance;
}

- (NSURLRequest *)generateGETRequestWithServiceIdentifier:(NSString *)serviceIdentifier requestParams:(NSDictionary *)requestParams methodName:(NSString *)methodName
{
    AIFService *service = [[AIFServiceFactory sharedInstance] serviceWithIdentifier:serviceIdentifier];
    NSString *urlString;
    if (service.apiVersion.length != 0) {
        urlString = [NSString stringWithFormat:@"%@/%@/%@", service.apiBaseUrl, service.apiVersion, methodName];
    } else {
        urlString = [NSString stringWithFormat:@"%@/%@", service.apiBaseUrl, methodName];
    }
    
    [self.httpRequestSerializer setValue:[[NSUUID UUID] UUIDString] forHTTPHeaderField:@"X-Req-Id"];
    [self.httpRequestSerializer setValue:NSLocalizedString(@"en", @"cn") forHTTPHeaderField:@"Accept-Language"];
    
    NSMutableURLRequest *request = [self.httpRequestSerializer requestWithMethod:@"GET" URLString:urlString parameters:requestParams error:NULL];
    request.requestParams = requestParams;
    if ([AIFAppContext sharedInstance].accessToken) {
        [request setValue:[AIFAppContext sharedInstance].accessToken forHTTPHeaderField:@"Authorization"];
    }
    return request;
}

- (NSURLRequest *)generatePOSTRequestWithServiceIdentifier:(NSString *)serviceIdentifier requestParams:(NSDictionary *)requestParams methodName:(NSString *)methodName
{
    AIFService *service = [[AIFServiceFactory sharedInstance] serviceWithIdentifier:serviceIdentifier];
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@", service.apiBaseUrl, service.apiVersion, methodName];
    
    [self.httpRequestSerializer setValue:[[NSUUID UUID] UUIDString] forHTTPHeaderField:@"X-Req-Id"];
    [self.httpRequestSerializer setValue:NSLocalizedString(@"en", @"cn") forHTTPHeaderField:@"Accept-Language"];
    
    NSMutableURLRequest *request = [self.httpRequestSerializer requestWithMethod:@"POST" URLString:urlString parameters:requestParams error:NULL];
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:requestParams options:0 error:NULL];
    if ([AIFAppContext sharedInstance].accessToken) {
        [request setValue:[AIFAppContext sharedInstance].accessToken forHTTPHeaderField:@"Authorization"];
    }
    request.requestParams = requestParams;
    return request;
}

- (NSURLRequest *)generatePutRequestWithServiceIdentifier:(NSString *)serviceIdentifier requestParams:(NSDictionary *)requestParams methodName:(NSString *)methodName
{
    AIFService *service = [[AIFServiceFactory sharedInstance] serviceWithIdentifier:serviceIdentifier];
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@", service.apiBaseUrl, service.apiVersion, methodName];
    
    [self.httpRequestSerializer setValue:[[NSUUID UUID] UUIDString] forHTTPHeaderField:@"X-Req-Id"];
    [self.httpRequestSerializer setValue:NSLocalizedString(@"en", @"cn") forHTTPHeaderField:@"Accept-Language"];
    
    NSMutableURLRequest *request = [self.httpRequestSerializer requestWithMethod:@"PUT" URLString:urlString parameters:requestParams error:NULL];
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:requestParams options:0 error:NULL];
    if ([AIFAppContext sharedInstance].accessToken) {
        [request setValue:[AIFAppContext sharedInstance].accessToken forHTTPHeaderField:@"Authorization"];
    }
    request.requestParams = requestParams;
    return request;
}

- (NSURLRequest *)generateDeleteRequestWithServiceIdentifier:(NSString *)serviceIdentifier requestParams:(NSDictionary *)requestParams methodName:(NSString *)methodName
{
    AIFService *service = [[AIFServiceFactory sharedInstance] serviceWithIdentifier:serviceIdentifier];
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@", service.apiBaseUrl, service.apiVersion, methodName];
    
    [self.httpRequestSerializer setValue:[[NSUUID UUID] UUIDString] forHTTPHeaderField:@"X-Req-Id"];
    [self.httpRequestSerializer setValue:NSLocalizedString(@"en", @"cn") forHTTPHeaderField:@"Accept-Language"];
    
    NSMutableURLRequest *request = [self.httpRequestSerializer requestWithMethod:@"DELETE" URLString:urlString parameters:requestParams error:NULL];
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:requestParams options:0 error:NULL];
    if ([AIFAppContext sharedInstance].accessToken) {
        [request setValue:[AIFAppContext sharedInstance].accessToken forHTTPHeaderField:@"Authorization"];
    }
    request.requestParams = requestParams;
    return request;
}

#pragma mark - getters and setters
- (AFHTTPRequestSerializer *)httpRequestSerializer
{
    if (_httpRequestSerializer == nil) {
        _httpRequestSerializer = [AFHTTPRequestSerializer serializer];
        _httpRequestSerializer.timeoutInterval = kAIFNetworkingTimeoutSeconds;
        _httpRequestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;
    }
    return _httpRequestSerializer;
}
@end
