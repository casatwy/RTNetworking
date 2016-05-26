//
//  TestAPIManager.m
//  CTNetworking
//
//  Created by casa on 15/12/31.
//  Copyright © 2015年 casa. All rights reserved.
//

#import "TestAPIManager.h"

NSString * const kYJTestAPIManagerParamsKeyMobileOrUnionId = @"mobileOrUnionId";

@interface TestAPIManager () <RTAPIManagerValidator>

@end

@implementation TestAPIManager

#pragma mark - life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.validator = self;
    }
    return self;
}

#pragma mark - RTAPIManager
- (NSString *)methodName
{
    NSString *mobileOrUnionId = @"";
    if (self.paramSource && [self.paramSource respondsToSelector:@selector(paramsForApi:)]) {
        mobileOrUnionId = [self.paramSource paramsForApi:self][kYJTestAPIManagerParamsKeyMobileOrUnionId];
    }
    return [NSString stringWithFormat:@"users/%@/actions/exist", mobileOrUnionId];
}

- (NSString *)serviceType
{
    return kAIFServiceYJ_1_0;
}

- (RTAPIManagerRequestType)requestType
{
    return RTAPIManagerRequestTypeGet;
}

- (BOOL)shouldCache
{
    return NO;
}

#pragma mark - RTAPIManagerValidator
- (BOOL)manager:(RTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data
{
    return YES;
}

- (BOOL)manager:(RTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data
{
    return YES;
}

@end
