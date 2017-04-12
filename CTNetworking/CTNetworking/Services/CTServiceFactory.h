//
//  AXServiceFactory.h
//  RTNetworking
//
//  Created by casa on 14-5-12.
//  Copyright (c) 2014年 casatwy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTService.h"


@protocol CTServiceFactoryDataSource <NSObject>

/*
 * key为service的Identifier
 * value为service的Class的字符串
 */
- (NSDictionary<NSString *,NSString *> *)servicesKindsOfServiceFactory;

@end

@interface CTServiceFactory : NSObject

@property (nonatomic, weak) id<CTServiceFactoryDataSource> dataSource;

+ (instancetype)sharedInstance;
- (CTService<CTServiceProtocol> *)serviceWithIdentifier:(NSString *)identifier;


@end
