//
//  NSArray+CTNetworkingMethods.m
//  RTNetworking
//
//  Created by casa on 14-5-13.
//  Copyright (c) 2014年 casatwy. All rights reserved.
//

#import "NSArray+CTNetworkingMethods.h"

@implementation NSArray (CTNetworkingMethods)

/** 字母排序之后形成的参数字符串 */
- (NSString *)CT_paramsString
{
    NSMutableString *paramString = [[NSMutableString alloc] init];
    
    NSArray *sortedParams = [self sortedArrayUsingSelector:@selector(compare:)];
    [sortedParams enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([paramString length] == 0) {
            [paramString appendFormat:@"%@", obj];
        } else {
            [paramString appendFormat:@"&%@", obj];
        }
    }];
    
    return paramString;
}

/** 数组变json */
- (NSString *)CT_jsonString
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:NULL];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
