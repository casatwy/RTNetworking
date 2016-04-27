//
//  AXApiProxy.m
//  RTNetworking
//
//  Created by casa on 14-5-12.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "AIFApiProxy.h"
#import "AIFServiceFactory.h"
#import "AIFRequestGenerator.h"
#import "AIFLogger.h"
#import "NSURLRequest+AIFNetworkingMethods.h"
#import "NSDictionary+AXNetworkingMethods.h"

static NSString * const kAXApiProxyDispatchItemKeyCallbackSuccess = @"kAXApiProxyDispatchItemCallbackSuccess";
static NSString * const kAXApiProxyDispatchItemKeyCallbackFail = @"kAXApiProxyDispatchItemCallbackFail";

@interface AIFApiProxy ()

@property (nonatomic, strong) NSMutableDictionary *dispatchTable;
@property (nonatomic, strong) NSNumber *recordedRequestId;

//AFNetworking stuff
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation AIFApiProxy
#pragma mark - getters and setters
- (NSMutableDictionary *)dispatchTable
{
    if (_dispatchTable == nil) {
        _dispatchTable = [[NSMutableDictionary alloc] init];
    }
    return _dispatchTable;
}

- (AFHTTPSessionManager *)sessionManager
{
    if (_sessionManager == nil) {
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil];
        _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return _sessionManager;
}

#pragma mark - life cycle
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static AIFApiProxy *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AIFApiProxy alloc] init];
    });
    return sharedInstance;
}

#pragma mark - public methods
- (NSInteger)callGETWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)servieIdentifier methodName:(NSString *)methodName success:(AXCallback)success fail:(AXCallback)fail
{
    NSURLRequest *request = [[AIFRequestGenerator sharedInstance] generateGETRequestWithServiceIdentifier:servieIdentifier requestParams:params methodName:methodName];
    NSNumber *requestId = [self callApiWithRequest:request success:success fail:fail];
    return [requestId integerValue];
}

- (NSInteger)callPOSTWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)servieIdentifier methodName:(NSString *)methodName success:(AXCallback)success fail:(AXCallback)fail
{
    NSURLRequest *request = [[AIFRequestGenerator sharedInstance] generatePOSTRequestWithServiceIdentifier:servieIdentifier requestParams:params methodName:methodName];
    NSNumber *requestId = [self callApiWithRequest:request success:success fail:fail];
    return [requestId integerValue];
}

- (NSInteger)callRestfulGETWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)servieIdentifier methodName:(NSString *)methodName success:(AXCallback)success fail:(AXCallback)fail
{
    NSURLRequest *request = [[AIFRequestGenerator sharedInstance] generateRestfulGETRequestWithServiceIdentifier:servieIdentifier requestParams:params methodName:methodName];
    NSNumber *requestId = [self callApiWithRequest:request success:success fail:fail];
    return [requestId integerValue];
}

- (NSInteger)callRestfulPOSTWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)servieIdentifier methodName:(NSString *)methodName success:(AXCallback)success fail:(AXCallback)fail
{
    NSURLRequest *request = [[AIFRequestGenerator sharedInstance] generateRestfulPOSTRequestWithServiceIdentifier:servieIdentifier requestParams:params methodName:methodName];
    NSNumber *requestId = [self callApiWithRequest:request success:success fail:fail];
    return [requestId integerValue];
}

- (NSInteger)callGoogleMapAPIWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)serviceIdentifier success:(AXCallback)success fail:(AXCallback)fail
{
    NSURLRequest *request = [[AIFRequestGenerator sharedInstance] generateGoolgeMapAPIRequestWithParams:params serviceIdentifier:serviceIdentifier];
    NSNumber *requestId = [self callApiWithRequest:request success:success fail:fail];
    return [requestId integerValue];
}

- (void)cancelRequestWithRequestID:(NSNumber *)requestID
{
    NSURLSessionDataTask *task = self.dispatchTable[requestID];
    [task cancel];
    [self.dispatchTable removeObjectForKey:requestID];
}

- (void)cancelRequestWithRequestIDList:(NSArray *)requestIDList
{
    for (NSNumber *requestId in requestIDList) {
        [self cancelRequestWithRequestID:requestId];
    }
}

#pragma mark - private methods
/** 这个函数存在的意义在于，如果将来要把AFNetworking换掉，只要修改这个函数的实现即可。 */
- (NSNumber *)callApiWithRequest:(NSURLRequest *)request success:(AXCallback)success fail:(AXCallback)fail
{
    // 之所以不用getter，是因为如果放到getter里面的话，每次调用self.recordedRequestId的时候值就都变了，违背了getter的初衷
    NSNumber *requestId = [self generateRequestId];
    
    // 跑到这里的block的时候，就已经是主线程了。
    NSURLSessionDataTask *task = [self.sessionManager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        NSURLSessionDataTask *storedTask = self.dispatchTable[requestId];
        if (storedTask == nil) {
            // 如果这个operation是被cancel的，那就不用处理回调了。
            return;
        }else{
            [self.dispatchTable removeObjectForKey:requestId];
        }
        NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        if (!error) {
            
            // success
            
            [AIFLogger logDebugInfoWithResponse:(NSHTTPURLResponse*)response
                                  resposeString:responseString
                                        request:request
                                          error:NULL];
            
            AIFURLResponse *response = [[AIFURLResponse alloc] initWithResponseString:responseString
                                                                            requestId:requestId
                                                                              request:request
                                                                         responseData:responseObject
                                                                               status:AIFURLResponseStatusSuccess];
            success?success(response):nil;
        }else{
            [AIFLogger logDebugInfoWithResponse:(NSHTTPURLResponse*)response
                                  resposeString:responseString
                                        request:request
                                          error:error];
 
            AIFURLResponse *response = [[AIFURLResponse alloc] initWithResponseString:responseString
                                                                            requestId:requestId
                                                                              request:request
                                                                         responseData:responseObject
                                                                                error:error];
             fail?fail(response):nil;
        }
    }];
    
    self.dispatchTable[requestId] = task;
    [task resume];
    return requestId;
}

- (NSNumber *)generateRequestId
{
    if (_recordedRequestId == nil) {
        _recordedRequestId = @(1);
    } else {
        if ([_recordedRequestId integerValue] == NSIntegerMax) {
            _recordedRequestId = @(1);
        } else {
            _recordedRequestId = @([_recordedRequestId integerValue] + 1);
        }
    }
    return _recordedRequestId;
}
@end
