//
//  AXRequestGenerator.m
//  RTNetworking
//
//  Created by casa on 14-5-14.
//  Copyright (c) 2014年 casatwy. All rights reserved.
//

#import "CTRequestGenerator.h"
#import "CTSignatureGenerator.h"
#import "CTServiceFactory.h"
#import "CTCommonParamsGenerator.h"
#import "NSDictionary+CTNetworkingMethods.h"
#import "NSObject+CTNetworkingMethods.h"
#import <AFNetworking/AFNetworking.h>
#import "CTService.h"
#import "CTLogger.h"
#import "NSURLRequest+CTNetworkingMethods.h"
#import "CTNetworkingConfigurationManager.h"
@interface CTRequestGenerator ()

@property (nonatomic, strong) AFHTTPRequestSerializer *httpRequestSerializer;

@end

@implementation CTRequestGenerator
#pragma mark - public methods
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static CTRequestGenerator *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CTRequestGenerator alloc] init];
    });
    return sharedInstance;
}

- (NSURLRequest *)generateGETRequestWithServiceIdentifier:(NSString *)serviceIdentifier requestParams:(NSDictionary *)requestParams methodName:(NSString *)methodName
{
    return [self generateRequestWithServiceIdentifier:serviceIdentifier requestParams:requestParams methodName:methodName requestWithMethod:@"GET"];
}

- (NSURLRequest *)generatePOSTRequestWithServiceIdentifier:(NSString *)serviceIdentifier requestParams:(NSDictionary *)requestParams methodName:(NSString *)methodName
{
    return [self generateRequestWithServiceIdentifier:serviceIdentifier requestParams:requestParams methodName:methodName requestWithMethod:@"POST"];
}

- (NSURLRequest *)generatePutRequestWithServiceIdentifier:(NSString *)serviceIdentifier requestParams:(NSDictionary *)requestParams methodName:(NSString *)methodName
{
    return [self generateRequestWithServiceIdentifier:serviceIdentifier requestParams:requestParams methodName:methodName requestWithMethod:@"PUT"];
}

- (NSURLRequest *)generateDeleteRequestWithServiceIdentifier:(NSString *)serviceIdentifier requestParams:(NSDictionary *)requestParams methodName:(NSString *)methodName
{
    return [self generateRequestWithServiceIdentifier:serviceIdentifier requestParams:requestParams methodName:methodName requestWithMethod:@"DELETE"];
}

- (NSURLRequest *)generateRequestWithServiceIdentifier:(NSString *)serviceIdentifier requestParams:(NSDictionary *)requestParams methodName:(NSString *)methodName requestWithMethod:(NSString *)method {
    CTService *service = [[CTServiceFactory sharedInstance] serviceWithIdentifier:serviceIdentifier];
    NSString *urlString = [service urlGeneratingRuleByMethodName:methodName];
    
    NSDictionary *totalRequestParams = [self totalRequestParamsByService:service requestParams:requestParams];
    
    NSMutableURLRequest *request = [self.httpRequestSerializer requestWithMethod:method URLString:urlString parameters:totalRequestParams error:NULL];
    
    if (![method isEqualToString:@"GET"] && [CTNetworkingConfigurationManager sharedInstance].shouldSetParamsInHTTPBodyButGET) {
        request.HTTPBody = [NSJSONSerialization dataWithJSONObject:requestParams options:0 error:NULL];
    }
    
    if ([service.child respondsToSelector:@selector(extraHttpHeadParmasWithMethodName:)]) {
        NSDictionary *dict = [service.child extraHttpHeadParmasWithMethodName:methodName];
        if (dict) {
            [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                [request setValue:obj forHTTPHeaderField:key];
            }];
        }
    }
    
    request.requestParams = totalRequestParams;
    return request;
}


#pragma mark - private method
//根据Service拼接额外参数
- (NSDictionary *)totalRequestParamsByService:(CTService *)service requestParams:(NSDictionary *)requestParams {
    NSMutableDictionary *totalRequestParams = [NSMutableDictionary dictionaryWithDictionary:requestParams];
    
    if ([service.child respondsToSelector:@selector(extraParmas)]) {
        if ([service.child extraParmas]) {
            [[service.child extraParmas] enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                [totalRequestParams setObject:obj forKey:key];
            }];
        }
    }
    return [totalRequestParams copy];
}


#pragma mark - getters and setters
- (AFHTTPRequestSerializer *)httpRequestSerializer
{
    if (_httpRequestSerializer == nil) {
        _httpRequestSerializer = [AFHTTPRequestSerializer serializer];
        _httpRequestSerializer.timeoutInterval = [CTNetworkingConfigurationManager sharedInstance].apiNetworkingTimeoutSeconds;
        _httpRequestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;
    }
    return _httpRequestSerializer;
}
@end
