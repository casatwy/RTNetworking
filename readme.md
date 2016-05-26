# CTNetworking

[![CocoaPods compatible](https://img.shields.io/badge/CocoaPods-0.1.0-green.svg?style=flat)](https://cocoapods.org) [![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://opensource.org/licenses/MIT)

`CTNetworking` is an 

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

1. Add a pod entry for CTNetworking to your Podfile `pod 'CTNetworking', '~> 0.1.0'`
2. Install the pod(s) by running `pod install`.
3. Include CTNetworking wherever you need it with `#import <CTNetworking/CTNetworking.h>`.

### Source files

Alternatively you can directly add 

1. Download the [latest code version](https://github.com/casatwy/CTNetworking/archive/master.zip) or add the repository as a git submodule to your git-tracked project.
2. Open your project in Xcode, then drag and drop `CTNetworking.h` and `CTNetworking.m` onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project.
3. Include CTNetworking wherever you need it with `#import "CTNetworking.h"`.

## Usage

CTNetworking can help you 

```objective-c
[CTNetworking showHUDWithType:CTNetworkingTypeDone duration:0.8 contentString:@"Done"];
```

See more in demo and welcome to post issues.

Enjoy.

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).
