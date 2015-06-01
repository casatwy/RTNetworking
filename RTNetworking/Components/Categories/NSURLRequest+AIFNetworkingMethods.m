//
//  NSURLRequest+AIFNetworkingMethods.m
//  RTNetworking
//
//  Created by casa on 14-5-26.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import "NSURLRequest+AIFNetworkingMethods.h"
#import <objc/runtime.h>

static void *AIFNetworkingRequestParams;

@implementation NSURLRequest (AIFNetworkingMethods)

- (void)setRequestParams:(NSDictionary *)requestParams
{
    objc_setAssociatedObject(self, &AIFNetworkingRequestParams, requestParams, OBJC_ASSOCIATION_COPY);
}

- (NSDictionary *)requestParams
{
    return objc_getAssociatedObject(self, &AIFNetworkingRequestParams);
}

@end
