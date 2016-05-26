//
//  TestCaseFactory.h
//  CTNetworking
//
//  Created by casa on 15/12/31.
//  Copyright © 2015年 casa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonHeader.h"

@interface TestCaseFactory : NSObject

- (UIViewController *)testCaseWithType:(TestCaseType)testCaseType;

@end
