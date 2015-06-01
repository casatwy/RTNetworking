//
//  AJKHDCityListManager.h
//  AnjukeHD
//
//  Created by casa on 13-12-15.
//  Copyright (c) 2013年 Anjuke Inc. All rights reserved.
//

#import "RTAPIBaseManager.h"
#import <CoreLocation/CoreLocation.h>

@interface AIFCityListManager : RTAPIBaseManager<RTAPIManagerApiCallBackDelegate, RTAPIManagerParamSourceDelegate, RTAPIManagerValidator>

- (NSDictionary *)cityWithLocation:(CLLocation *)location;
- (NSDictionary *)cityInfoWithCityId:(NSString *)cityId;
- (NSDictionary *)cityInfoWithCityName:(NSString *)cityName;

- (NSArray *)cities;
- (CLLocation *)cityLocationWithCityId:(NSString *)cityId;
- (CGPoint)cityOffsetWithCityId:(NSString *)cityId;
- (NSString *)cityNameWithCityId:(NSString *)cityId;

- (NSDictionary *)cityIsOpenWithCityId:(NSString *)cityId;

- (BOOL)isLocation:(CLLocation *)location inCity:(NSString *)cityId;

//在程序进入后台的时候会把当前城市数据保存起来，用于下次打开的时候显示上次关闭时候的城市。
- (void)saveCityToPlistWithData:(NSDictionary *)cityData;
- (NSDictionary *)loadCurrentCityDataFromPlist;

@end
