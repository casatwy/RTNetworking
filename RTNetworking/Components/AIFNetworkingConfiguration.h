//
//  AXNetworkingConfiguration.h
//  RTNetworking
//
//  Created by casa on 14-5-13.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#ifndef AIFNetworking_AIFNetworkingConfiguration_h
#define AIFNetworking_AIFNetworkingConfiguration_h

typedef NS_ENUM(NSInteger, AIFAppType) {
    AIFAppTypeAnjuke,
    AIFAppTypeBroker,
    AIFAppTypeAifang,
    AIFAppTypeErShouFang,
    AIFAppTypeHaozu
};

typedef NS_ENUM(NSUInteger, AIFURLResponseStatus)
{
    AIFURLResponseStatusSuccess, //作为底层，请求是否成功只考虑是否成功收到服务器反馈。至于签名是否正确，返回的数据是否完整，由上层的RTApiBaseManager来决定。
    AIFURLResponseStatusErrorTimeout,
    AIFURLResponseStatusErrorNoNetwork // 默认除了超时以外的错误都是无网络错误。
};

static NSTimeInterval kAIFNetworkingTimeoutSeconds = 20.0f;

static NSString *AIFKeychainServiceName = @"com.anjukeApps";
static NSString *AIFUDIDName = @"anjukeAppsUDID";
static NSString *AIFPasteboardType = @"anjukeAppsContent";

static BOOL kAIFShouldCache = NO;
static NSTimeInterval kAIFCacheOutdateTimeSeconds = 300; // 5分钟的cache过期时间
static NSUInteger kAIFCacheCountLimit = 1000; // 最多1000条cache

// anjuke
extern NSString * const kAIFServiceAnjuke;
extern NSString * const kAIFServiceAnjukeREST_4;
extern NSString * const kAIFServiceAnjukeCorp;
extern NSString * const kAIFServiceAnjukeRest;
extern NSString * const kAIFServiceAnjukeV5;

// x
extern NSString * const kAIFServiceXRest;
extern NSString * const kAIFServiceXAudioRest;
extern NSString * const kAIFServiceXPublicRest;
extern NSString * const kAIFServiceXUnread;

// broker
extern NSString * const kAIFServiceBrokerRest;
extern NSString * const kAIFServiceBrokerCorp;
extern NSString * const kAIFServiceBroker;

// haozu
extern NSString * const kAIFServiceHaozu;
extern NSString * const kAIFServiceHaozuCorp;

// xinfang
extern NSString * const kAIFServiceXinfang;

// jinpu
extern NSString * const kAIFServiceJinpuRest;

// other
extern NSString * const kAIFServiceCoordinatorChannel;
extern NSString * const kAIFServiceMarket;
extern NSString * const kAIFServiceMember;
extern NSString * const kAIFServiceNotification;
extern NSString * const kAIFServiceTrace;
extern NSString * const kAIFServiceURLChange;

// Google Map API
extern NSString * const kAIFServiceGoogleMapAPIDirections;

#endif
