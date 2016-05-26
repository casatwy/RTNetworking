//
//  AIFLogConfig.m
//  AIFLogTrackCenter
//
//  Created by Softwind.Tang on 14-5-15.
//  Copyright (c) 2014年 casatwy Inc. All rights reserved.
//

#import "AIFLoggerConfiguration.h"
#import "AIFServiceFactory.h"

@implementation AIFLoggerConfiguration

- (void)configWithAppType:(AIFAppType)appType
{
    switch (appType) {
        case AIFAppTypePlayPlus:
            self.appKey = @"xxxxxx";
            self.serviceType = @"xxxxx";
            self.sendLogMethod = @"xxxx";
            self.sendActionMethod = @"xxxxxx";
            self.sendLogKey = @"xxxxx";
            self.sendActionKey = @"xxxx";
            break;
    }
}

@end
