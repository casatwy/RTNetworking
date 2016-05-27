//
//  CTLogConfig.m
//  CTLogTrackCenter
//
//  Created by Softwind.Tang on 14-5-15.
//  Copyright (c) 2014年 casatwy Inc. All rights reserved.
//

#import "CTLoggerConfiguration.h"
#import "CTServiceFactory.h"

@implementation CTLoggerConfiguration

- (void)configWithAppType:(CTAppType)appType
{
    switch (appType) {
        case CTAppTypexxx:
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
