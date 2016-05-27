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
        case AIFAppTypeAnjuke:
            self.channelID = [AIFAppContext sharedInstance].channelID;
            self.appKey = @"appKey";
            self.logAppName = [AIFAppContext sharedInstance].appName;
            self.serviceType = kAIFServiceAnjuke;
            self.sendLogMethod = @"admin.writeAppLog";
            self.sendActionMethod = @"admin.recordaction";
            self.sendLogKey = @"data";
            self.sendActionKey = @"action_note";
            break;
            
        case AIFAppTypeBroker:
            self.channelID = [AIFAppContext sharedInstance].channelID;
            self.appKey = @"appKey";
            self.logAppName = [AIFAppContext sharedInstance].appName;
            self.serviceType = kAIFServiceBrokerRest;
            self.sendLogMethod = @"admin.writeAppLog";
            self.sendActionMethod = @"nlog/";
            self.sendLogKey = @"data";
            self.sendActionKey = @"log";
            break;
            
        default:
            self.channelID = [AIFAppContext sharedInstance].channelID;
            self.appKey = @"appKey";
            self.logAppName = [AIFAppContext sharedInstance].appName;
            self.serviceType = kAIFServiceAnjuke;
            self.sendLogMethod = @"admin.writeAppLog";
            self.sendActionMethod = @"admin.recordaction";
            self.sendLogKey = @"data";
            self.sendActionKey = @"action_note";
            break;
    }
}

@end
