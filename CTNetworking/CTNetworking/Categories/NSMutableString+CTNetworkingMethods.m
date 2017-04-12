//
//  NSMutableString+CTNetworkingMethods.m
//  RTNetworking
//
//  Created by casa on 14-5-17.
//  Copyright (c) 2014年 casatwy. All rights reserved.
//

#import "NSMutableString+CTNetworkingMethods.h"
#import "NSObject+CTNetworkingMethods.h"

@implementation NSMutableString (CTNetworkingMethods)

- (void)CT_appendURLRequest:(NSURLRequest *)request
{
    [self appendFormat:@"\n\nHTTP URL:\n\t%@", request.URL];
    [self appendFormat:@"\n\nHTTP Header:\n%@", request.allHTTPHeaderFields ? request.allHTTPHeaderFields : @"\t\t\t\t\tN/A"];
    [self appendFormat:@"\n\nHTTP Body:\n\t%@", [[[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding] CT_defaultValue:@"\t\t\t\tN/A"]];
}

@end
