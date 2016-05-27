//
//  NSDictionary+AXNetworkingMethods.h
//  RTNetworking
//
//  Created by casa on 14-5-6.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (AXNetworkingMethods)

- (NSString *)aif_urlParamsStringSignature:(BOOL)isForSignature;
- (NSString *)aif_jsonString;
- (NSArray *)aif_transformedUrlParamsArraySignature:(BOOL)isForSignature;

@end
