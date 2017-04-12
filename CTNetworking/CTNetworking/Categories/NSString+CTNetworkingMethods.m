//
//  NSString+CTNetworkingMethods.m
//  RTNetworking
//
//  Created by casa on 14-5-6.
//  Copyright (c) 2014年 casatwy. All rights reserved.
//

#import "NSString+CTNetworkingMethods.h"
#include <CommonCrypto/CommonDigest.h>
#import "NSObject+CTNetworkingMethods.h"

@implementation NSString (CTNetworkingMethods)

- (NSString *)CT_md5
{
	NSData* inputData = [self dataUsingEncoding:NSUTF8StringEncoding];
	unsigned char outputData[CC_MD5_DIGEST_LENGTH];
	CC_MD5([inputData bytes], (unsigned int)[inputData length], outputData);
	
	NSMutableString* hashStr = [NSMutableString string];
	int i = 0;
	for (i = 0; i < CC_MD5_DIGEST_LENGTH; ++i)
		[hashStr appendFormat:@"%02x", outputData[i]];
	
	return hashStr;
}

@end
