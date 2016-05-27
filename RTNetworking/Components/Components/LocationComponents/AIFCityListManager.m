//
//  AJKHDCityListManager.m
//  AnjukeHD
//
//  Created by casa on 13-12-15.
//  Copyright (c) 2013年 Anjuke Inc. All rights reserved.
//

#import "AIFCityListManager.h"
#import "AIFPlistManager.h"
#import "AIFNetworking.h"

@interface AIFCityListManager ()

@property (nonatomic, copy, readwrite) NSString *methodName;

@property (nonatomic, copy) id cityData;
@property (nonatomic, strong) AIFPlistManager *plistManager;

@end

@implementation AIFCityListManager

@synthesize methodName = _methodName;

#pragma mark - life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        _methodName = @"_methodName";
        
        self.delegate = self;
        self.paramSource = self;
        self.validator = self;
        
        [self loadCityListDataFromPlist];
    }
    return self;
}

#pragma mark - public method
- (void)saveCityList
{
    [self.plistManager saveData:self.cityData withFileName:@"CityList"];
}

- (NSDictionary *)cityWithLocation:(CLLocation *)location
{
    if (![self.cityData isKindOfClass:[NSArray class]]) {
        return nil; //没data的情况下错误回馈
    }
    NSArray *cityList = (NSArray *)self.cityData;
    CLLocationCoordinate2D coordinate = location.coordinate;
    for (NSDictionary *ct in cityList) {
        NSDictionary *city = ct[@"ct"];
        NSArray *shapeArray = city[@"gmap_info"][@"shape"];
        
        CLLocationDegrees minLatitude = [shapeArray[2][1] doubleValue];
        CLLocationDegrees maxLatitude = [shapeArray[0][1] doubleValue];
        CLLocationDegrees minLongitude = [shapeArray[0][0] doubleValue];
        CLLocationDegrees maxLogitude = [shapeArray[1][0] doubleValue];
        
        //比较坐标
        if (coordinate.latitude >= minLatitude &&
            coordinate.longitude >= minLongitude &&
            coordinate.latitude <= maxLatitude &&
            coordinate.longitude <= maxLogitude) {
            return @{@"id":city[@"id"], @"name":city[@"name"]};
        }
    }
    return nil;
}

- (CLLocation *)cityLocationWithCityId:(NSString *)cityId
{
    for (NSDictionary *ct in self.cityData) {
        NSDictionary *city = ct[@"ct"];
        if ([city[@"id"] isEqualToString:cityId]) {
            NSArray *locationArray = city[@"gmap_info"][@"center"];
            CLLocation *location = [[CLLocation alloc] initWithLatitude:[locationArray[1] doubleValue] longitude:[locationArray[0] doubleValue]];
            return location;
        }
    }
    return nil;
}

- (CGPoint)cityOffsetWithCityId:(NSString *)cityId
{
    for (NSDictionary *ct in self.cityData) {
        NSDictionary *city = ct[@"ct"];
        if ([city[@"id"] isEqualToString:cityId]) {
            NSArray *locationArray = city[@"gmap_info"][@"diff"];
            return CGPointMake([locationArray[1] doubleValue], [locationArray[0] doubleValue]);
        }
    }
    return CGPointZero;
}

- (NSString *)cityNameWithCityId:(NSString *)cityId
{
    NSString *result = nil;
    
    for (NSDictionary *ct in self.cityData) {
        NSDictionary *city = ct[@"ct"];
        if ([city[@"id"] isEqualToString:cityId]) {
            result = [city[@"name"] copy];
        }
    }
    
    return result;
}

- (NSDictionary *)cityInfoWithCityId:(NSString *)cityId
{
    NSDictionary *result = nil;
    
    for (NSDictionary *ct in self.cityData) {
        NSDictionary *city = ct[@"ct"];
        if ([city[@"id"] isEqualToString:cityId]) {
            result = [city copy];
        }
    }
    
    return result;
}

- (NSDictionary *)cityInfoWithCityName:(NSString *)cityName
{
    NSDictionary *result = nil;
    
    for (NSDictionary *ct in self.cityData) {
        NSDictionary *city = ct[@"ct"];
        if ([city[@"name"] isEqualToString:cityName]) {
            result = [city copy];
        }
    }
    
    return result;
}

- (NSDictionary *)cityIsOpenWithCityId:(NSString *)cityId
{
    if ([cityId isEqualToString:@"-1"]) {
        return nil;
    }
    for (NSDictionary *ct in self.cityData) {
        NSDictionary *city = ct[@"ct"];
        if ([city[@"id"] isEqualToString:cityId]) {
            return ct[@"isopen"];
        }
    }
    return nil;
}

- (NSArray *)cities
{
    if ([self.cityData isKindOfClass:[NSArray class]]) {
        return self.cityData;
    }
    return nil;
}

- (BOOL)isLocation:(CLLocation *)location inCity:(NSString *)cityId
{
    if (![self.cityData isKindOfClass:[NSArray class]]) {
        //如果cityListManager没有城市数据，则认为这个location不属于这个城市。
        return NO;
    }
    
    NSArray *cityList = self.cityData;
    CLLocationCoordinate2D coordinate = location.coordinate;
    
    for (NSDictionary *ct in cityList) {
        NSDictionary *city = ct[@"ct"];
        if ([city[@"id"] isEqualToString:cityId]) {
            NSArray *shapeArray = city[@"gmap_info"][@"shape"];
            
            //提取左下角数据 具体参考api返回
            CLLocationCoordinate2D leftBottom =
            CLLocationCoordinate2DMake(
                                       [[[shapeArray objectAtIndex:3] objectAtIndex:1] doubleValue],
                                       [[[shapeArray objectAtIndex:3] objectAtIndex:0] doubleValue]);
            //提取右上角数据
            CLLocationCoordinate2D rightBottom =
            CLLocationCoordinate2DMake(
                                       [[[shapeArray objectAtIndex:1] objectAtIndex:1] doubleValue],
                                       [[[shapeArray objectAtIndex:1] objectAtIndex:0] doubleValue]);
            //比较坐标
            if (coordinate.latitude >= leftBottom.latitude &&
                coordinate.longitude >= leftBottom.longitude &&
                coordinate.latitude <= rightBottom.latitude &&
                coordinate.longitude <= rightBottom.longitude) {
                return YES;
            }
        }
    }
    
    return NO;
}

- (void)saveCityToPlistWithData:(NSDictionary *)cityData
{
    if (cityData[@"cityId"] == nil) {
        return;
    }
    
    NSString *plistPath;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    plistPath = [rootPath stringByAppendingPathComponent:@"CurrentCity.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        [[NSFileManager defaultManager] createFileAtPath:plistPath contents:nil attributes:nil];
    }
    
    NSString *error = nil;
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:@{@"cityId":cityData[@"cityId"], @"cityName":cityData[@"cityName"]}
                                                                   format:NSPropertyListXMLFormat_v1_0
                                                         errorDescription:&error];
    if(plistData) {
        [plistData writeToFile:plistPath atomically:YES];
    }else {
        NSLog(@"Error saving plist: %@", error);
    }
}

- (NSDictionary *)loadCurrentCityDataFromPlist
{
    NSString *plistPath;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    NSPropertyListFormat format;
    NSString *errorDesc = nil;
    
    plistPath = [rootPath stringByAppendingPathComponent:@"CurrentCity.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        [[NSFileManager defaultManager] createFileAtPath:plistPath contents:nil attributes:nil];
    }
    NSData *plistData = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSDictionary *fetchedData = [NSPropertyListSerialization
                                 propertyListFromData:plistData
                                 mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                 format:&format
                                 errorDescription:&errorDesc];
    return fetchedData;
}

#pragma mark - private method
- (void)loadCityListDataFromPlist
{
    self.cityData = [self.plistManager loadDataWithFileName:@"CityList"];
}

#pragma mark - RTAPIManagerApiCallBackDelegate
- (void)managerCallAPIDidSuccess:(RTAPIBaseManager *)manager
{
    if ([manager isKindOfClass:[AIFCityListManager class]]) {
        NSDictionary *returnValue = [self fetchDataWithReformer:nil];
        NSArray *cityList = returnValue[@"city"];
        self.cityData = [cityList sortedArrayUsingComparator:^(id a, id b){
            NSDictionary *first = (NSDictionary *)a;
            NSString *firstPinyin = first[@"ct"][@"pinyin"];
            
            NSDictionary *second = (NSDictionary *)b;
            NSString *secondPinyin = second[@"ct"][@"pinyin"];
            
            return [firstPinyin compare:secondPinyin];
        }];
        [self saveCityList];
    }
}

- (void)managerCallAPIDidFailed:(RTAPIBaseManager *)manager
{
    //do nothing
}

#pragma mark - RTAPIManagerParamSourceDelegate
- (NSDictionary *)paramsForApi:(RTAPIBaseManager *)manager
{
    return @{@"maptype":@"google"};
}

#pragma mark - RTAPIManagerValidator
- (BOOL)manager:(RTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data
{
    if ([data[@"city"] count] > 0) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)manager:(RTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data
{
    /*
        我们的城市数据只有在发布前才会下载一下，然后存成Plist文件之后，再取出来放到bundle里面去。
        平时是不会调用这个API的，因此在这里把调用API的开关关闭了。
        如果需要调用API获得数据，return YES;即可。
     */
    return NO;
}

#pragma mark - getters and setters
- (AIFPlistManager *)plistManager
{
    if (_plistManager == nil) {
        _plistManager = [[AIFPlistManager alloc] init];
    }
    return _plistManager;
}

@end
