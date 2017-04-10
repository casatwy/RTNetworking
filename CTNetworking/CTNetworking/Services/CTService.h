//
//  AXService.h
//  RTNetworking
//
//  Created by casa on 14-5-15.
//  Copyright (c) 2014年 casatwy. All rights reserved.
//

#import <Foundation/Foundation.h>

// 所有CTService的派生类都要符合这个protocol
@protocol CTServiceProtocol <NSObject>

@property (nonatomic, readonly) BOOL isOnline;

@property (nonatomic, readonly) NSString *offlineApiBaseUrl;
@property (nonatomic, readonly) NSString *onlineApiBaseUrl;

@property (nonatomic, readonly) NSString *offlineApiVersion;
@property (nonatomic, readonly) NSString *onlineApiVersion;

@property (nonatomic, readonly) NSString *onlinePublicKey;
@property (nonatomic, readonly) NSString *offlinePublicKey;

@property (nonatomic, readonly) NSString *onlinePrivateKey;
@property (nonatomic, readonly) NSString *offlinePrivateKey;

@optional

//为某些Service需要拼凑额外字段到URL处
- (NSDictionary *)extraParmas;

//为某些Service需要拼凑额外的头，如accessToken
- (NSDictionary *)extraHttpHeadParmas;

- (NSString *)urlGeneratingRuleByMethodName:(NSString *)method;

@end

@interface CTService : NSObject

@property (nonatomic, strong, readonly) NSString *publicKey;
@property (nonatomic, strong, readonly) NSString *privateKey;
@property (nonatomic, strong, readonly) NSString *apiBaseUrl;
@property (nonatomic, strong, readonly) NSString *apiVersion;

@property (nonatomic, weak, readonly) id<CTServiceProtocol> child;

//因为考虑到每家公司的拼凑逻辑都有或多或少不同，所以将默认的方式提取出来，允许子类覆写
//如有的公司为http://abc.com/v2/api/login或者http://v2.abc.com/api/login
- (NSString *)urlGeneratingRuleByMethodName:(NSString *)method;


@end
