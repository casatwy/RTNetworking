//
//  AXPublicURLParamsGenerator.m
//  RTNetworking
//
//  Created by casa on 14-5-6.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import "AIFCommonParamsGenerator.h"
#import "AIFAppContext.h"
#import "NSDictionary+AXNetworkingMethods.h"

@implementation AIFCommonParamsGenerator

+ (NSDictionary *)commonParamsDictionary
{
    AIFAppContext *context = [AIFAppContext sharedInstance];
    return @{
             @"cid":context.cid,
             @"ostype2":context.ostype2,
             @"udid2":context.udid2,
             @"uuid2":context.uuid2,
             @"app":context.appName,
             @"cv":context.cv,
             @"from":context.from,
             @"m":context.m,
             @"macid":context.macid,
             @"o":context.o,
             @"pm":context.pm,
             @"qtime":context.qtime,
             @"uuid":context.uuid,
             @"i":context.i,
             @"v":context.v
             };
}

+ (NSDictionary *)commonParamsDictionaryForLog
{
    AIFAppContext *context = [AIFAppContext sharedInstance];
    return @{
             @"guid":context.guid,
             @"dvid":context.dvid,
             @"net":context.net,
             @"ver":context.ver,
             @"ip":context.ip,
             @"mac":context.mac,
             @"geo":context.geo,
             @"uid":context.uid,
             @"chat_id":context.chatid,
             @"ccid":context.ccid,
             @"gcid":context.gcid,
             @"p":context.p,
             @"os":context.os,
             @"v":context.v,
             @"app":context.app,
             @"ch":context.channelID,
             @"ct":context.ct,
             @"pmodel":context.pmodel
             };
}

@end
