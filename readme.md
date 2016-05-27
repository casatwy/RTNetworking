# CTNetworking

[![CocoaPods compatible](https://img.shields.io/badge/CocoaPods-1.0.0-green.svg?style=flat)](https://cocoapods.org) [![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://opensource.org/licenses/MIT)

`CTNetworking` is an iOS discrete HTTP API calling framework based on AFNetworking.[Click for more detail(in Chinese)](http://casatwy.com/iosying-yong-jia-gou-tan-wang-luo-ceng-she-ji-fang-an.html)

## Requirements

`CTNetworking` works on iOS 8.0+ and requires ARC to build. It depends on the following Apple frameworks, which should already be included with most Xcode templates:

* Foundation.framework
* UIKit.framework
* CoreGraphics.framework
* QuartzCore.framework
* AFNetworking

You will need the latest developer tools in order to build `CTNetworking`. Old Xcode versions might work, but compatibility will not be explicitly maintained.

## Adding CTNetworking to your project

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to add CTNetworking to your project.

1. Add a pod entry for CTNetworking to your Podfile `pod 'CTNetworking'`
2. Install the pod(s) by running `pod install`.
3. Include CTNetworking wherever you need it with `#import <CTNetworking/CTNetworking.h>`.
4. Add code in `CTNetworkingCustoms` folder to custom your own Networking layer.

## Demo

Just download or clone the whole project and DO NOT FORGET `$ pod update --verbose`

## Usage

### Call API

CTNetworking API URL is constituted by 4 part:

`CTService`+`CTService Version`+`API method Name`+`API Parameters`

#### Custom a CTService

Inherit `CTService` and follow `CTServiceProtocal`

```objective-c
@interface GDMapService : CTService <CTServiceProtocal>
```

Implement all methods of `CTServiceProtocal`

```objective-c
...
- (NSString *)onlineApiBaseUrl
{
    return @"http://restapi.amap.com";
}
- (NSString *)onlineApiVersion
{
    return @"v3";
}
...
```

#### Custom an APIManager

Inherit `CTAPIBaseManager` and follow `CTAPIManager` Protocal

```objective-c
@interface TestAPIManager : CTAPIBaseManager <CTAPIManager>
```

Implement all methods of `CTAPIManager`

```objective-c
...
- (NSString *)methodName
{
    return @"geocode/regeo";
}

- (NSString *)serviceType
{
    return kCTServiceGDMapV3;
}

- (CTAPIManagerRequestType)requestType
{
    return CTAPIManagerRequestTypeGet;
}
...
```

#### Call API

Instantiation of API Manager in class

```objective-c
@property (nonatomic, strong) TestAPIManager *testAPIManager;

- (TestAPIManager *)testAPIManager
{
    if (_testAPIManager == nil) {
        _testAPIManager = [[TestAPIManager alloc] init];
        _testAPIManager.delegate = self;
        _testAPIManager.paramSource = self;
    }
    return _testAPIManager;
}
```

Implement methods of `CTAPIManagerParamSource` and `CTAPIManagerCallBackDelegate`

```objective-c
#pragma mark - CTAPIManagerParamSource
- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager
{
    return parmas;
}

#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager
{
    //do something
}
- (void)managerCallAPIDidFailed:(CTAPIBaseManager *)manager
{
    //do something
}
```

And easy to use

```objective-c
[self.testAPIManager loadData];
```

### AppContext settings

You SHOULD custom `CTAppContext` to set App networking layer settings. Also, you can add more settings to use.

See more in demo and [Click for more detail(in Chinese)](http://casatwy.com/iosying-yong-jia-gou-tan-wang-luo-ceng-she-ji-fang-an.html)


Enjoy.

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).
