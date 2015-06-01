//
//  AXRuntimeInfomation.h
//  RTNetworking
//
//  Created by casa on 14-5-6.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIFNetworkingConfiguration.h"

@interface AIFAppContext : NSObject

//凡是未声明成readonly的都是需要在初始化的时候由外面给的

@property (nonatomic, copy) NSString *channelID;    //渠道号
@property (nonatomic, copy) NSString *appName;      //应用名称
@property (nonatomic, assign) AIFAppType appType;

@property (nonatomic, copy, readonly) NSString *cid;          //城市id
@property (nonatomic, copy, readonly) NSString *m;            //设备名称
@property (nonatomic, copy, readonly) NSString *o;            //系统名称
@property (nonatomic, copy, readonly) NSString *v;            //系统版本
@property (nonatomic, copy, readonly) NSString *cv;           //Bundle版本
@property (nonatomic, copy, readonly) NSString *from;         //请求来源，值都是@"mobile"
@property (nonatomic, copy, readonly) NSString *ostype2;      //操作系统类型
@property (nonatomic, copy, readonly) NSString *qtime;        //发送请求的时间
@property (nonatomic, copy, readonly) NSString *macid;
@property (nonatomic, copy, readonly) NSString *uuid;
@property (nonatomic, copy, readonly) NSString *udid2;
@property (nonatomic, copy, readonly) NSString *uuid2;
@property (nonatomic, copy, readonly) NSString *i;
@property (nonatomic, copy, readonly) NSString *pm;       //渠道号
@property (nonatomic, readonly) BOOL isReachable;

// log相关的参数
@property (nonatomic, copy) NSString *currentPageNumber;    //当前controller的pageNumber，记log用
@property (nonatomic, copy) NSString *uid; //登录用户token
@property (nonatomic, copy) NSString *chatid; //登录用户chat id
@property (nonatomic, copy) NSString *ccid; // 用户选择的城市id

@property (nonatomic, copy, readonly) NSString *gcid; // 用户当前所在城市的id
@property (nonatomic, copy, readonly) NSString *bp;         //上一个页面的pageNumber,记log用
@property (nonatomic, copy, readonly) NSString *guid;
@property (nonatomic, copy, readonly) NSString *net;
@property (nonatomic, copy, readonly) NSString *ip;
@property (nonatomic, copy, readonly) NSString *geo;
@property (nonatomic, copy, readonly) NSString *ver; // log 版本
@property (nonatomic, copy, readonly) NSString *dvid;
@property (nonatomic, copy, readonly) NSString *mac;
@property (nonatomic, copy, readonly) NSString *p;
@property (nonatomic, copy, readonly) NSString *os;
@property (nonatomic, copy, readonly) NSString *app;
@property (nonatomic, copy, readonly) NSString *ch;
@property (nonatomic, copy, readonly) NSString *ct;
@property (nonatomic, copy, readonly) NSString *pmodel;

+ (instancetype)sharedInstance;
- (void)configWithChannelID:(NSString *)channelID appName:(NSString *)appName appType:(AIFAppType)appType ccid:(NSString *)ccid;

@end
