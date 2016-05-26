//
//  TestCaseFactory.m
//  CTNetworking
//
//  Created by casa on 15/12/31.
//  Copyright © 2015年 casa. All rights reserved.
//

#import "TestCaseFactory.h"

#import "FireSingleAPI.h"

@implementation TestCaseFactory

- (UIViewController *)testCaseWithType:(TestCaseType)testCaseType
{
    UIViewController *testCase = nil;
    
    if (testCaseType == TestCaseTypeFireSingleAPI) {
        testCase = [[FireSingleAPI alloc] init];
    }
    
    return testCase;
}

@end
