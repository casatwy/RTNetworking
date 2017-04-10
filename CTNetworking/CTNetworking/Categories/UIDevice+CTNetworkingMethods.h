//
//  UIDevice(Identifier).h
//  UIDeviceAddition
//
//  Created by Georg Kitz on 20.08.11.
//  Copyright 2011 Aurora Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIDevice (CTNetworkingMethods)

/*
 * @method uuid
 * @description apple identifier support iOS6 and iOS5 below
 */

- (NSString *) CT_macaddress;
- (NSString *) CT_macaddressMD5;
- (NSString *) CT_machineType;
- (NSString *) CT_ostype;//显示“ios6，ios5”，只显示大版本号

@end
