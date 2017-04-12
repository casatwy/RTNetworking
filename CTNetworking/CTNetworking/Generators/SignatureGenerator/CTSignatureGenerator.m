//
//  AXApiSignatureVerifier.m
//  RTNetworking
//
//  Created by casa on 14-5-13.
//  Copyright (c) 2014年 casatwy. All rights reserved.
//

#import "CTSignatureGenerator.h"
#import "CTCommonParamsGenerator.h"
#import "NSDictionary+CTNetworkingMethods.h"
#import "NSString+CTNetworkingMethods.h"
#import "NSArray+CTNetworkingMethods.h"

@implementation CTSignatureGenerator

#pragma mark - public methods
+ (NSString *)signGetWithSigParams:(NSDictionary *)allParams methodName:(NSString *)methodName apiVersion:(NSString *)apiVersion privateKey:(NSString *)privateKey publicKey:(NSString *)publicKey
{
    NSString *sigString = [allParams CT_urlParamsStringSignature:YES];
    return [[NSString stringWithFormat:@"%@%@", sigString, privateKey] CT_md5];
}

+ (NSString *)signRestfulGetWithAllParams:(NSDictionary *)allParams methodName:(NSString *)methodName apiVersion:(NSString *)apiVersion privateKey:(NSString *)privateKey
{
    NSString *part1 = [NSString stringWithFormat:@"%@/%@", apiVersion, methodName];
    NSString *part2 = [allParams CT_urlParamsStringSignature:YES];
    NSString *part3 = privateKey;
    
    NSString *beforeSign = [NSString stringWithFormat:@"%@%@%@", part1, part2, part3];
    return [beforeSign CT_md5];
}

+ (NSString *)signPostWithApiParams:(NSDictionary *)apiParams privateKey:(NSString *)privateKey publicKey:(NSString *)publicKey
{
    NSMutableDictionary *sigParams = [NSMutableDictionary dictionaryWithDictionary:apiParams];
    sigParams[@"api_key"] = publicKey;
    NSString *sigString = [sigParams CT_urlParamsStringSignature:YES];
    return [[NSString stringWithFormat:@"%@%@", sigString, privateKey] CT_md5];
}

+ (NSString *)signRestfulPOSTWithApiParams:(id)apiParams commonParams:(NSDictionary *)commonParams methodName:(NSString *)methodName apiVersion:(NSString *)apiVersion privateKey:(NSString *)privateKey
{
    NSString *part1 = [NSString stringWithFormat:@"%@/%@", apiVersion, methodName];
    NSString *part2 = [commonParams CT_urlParamsStringSignature:YES];
    NSString *part3 = nil;
    if ([apiParams isKindOfClass:[NSDictionary class]]) {
        part3 = [(NSDictionary *)apiParams CT_jsonString];
    } else if ([apiParams isKindOfClass:[NSArray class]]) {
        part3 = [(NSArray *)apiParams CT_jsonString];
    } else {
        return @"";
    }
    
    NSString *part4 = privateKey;
    
    NSString *beforeSign = [NSString stringWithFormat:@"%@%@%@%@", part1, part2, part3, part4];
    
    return [beforeSign CT_md5];
}

@end
