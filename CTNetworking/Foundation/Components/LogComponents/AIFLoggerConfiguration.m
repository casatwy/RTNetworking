//
//  AIFLogConfig.m
//  AIFLogTrackCenter
//
//  Created by Softwind.Tang on 14-5-15.
//  Copyright (c) 2014年 Anjuke Inc. All rights reserved.
//

#import "AIFLoggerConfiguration.h"
#import "AIFServiceFactory.h"

@implementation AIFLoggerConfiguration

- (void)configWithAppType:(AIFAppType)appType
{
    switch (appType) {
        case AIFAppTypePlayPlus:
            self.appKey = @"4fb9c2c0527015056a00001a";
            self.serviceType = kAIFServiceBeautifulShareLog;
            self.sendLogMethod = @"admin.writeAppLog";
            self.sendActionMethod = @"admin.recordaction";
            self.sendLogKey = @"data";
            self.sendActionKey = @"action_note";
            break;
    }
}

@end
