//
//  LGBaseAPICommand.m
//  CTNetworking
//
//  Created by Corotata on 2017/4/12.
//  Copyright © 2017年 Corotata. All rights reserved.
//

#import "LGBaseAPICommand.h"


@interface LGBaseAPICommand()<CTAPIManagerCallBackDelegate>

@end

@implementation LGBaseAPICommand

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        _delegate = nil;
//        
//        if ([self conformsToProtocol:@protocol(CTAPICommand)]) {
//            self.child = (id <CTAPICommand>)self;
//        } else {
//            self.child = (id <CTAPICommand>)self;
//            NSException *exception = [[NSException alloc] initWithName:@"LGBaseAPICommand提示" reason:[NSString stringWithFormat:@"%@没有遵循CTAPICommand协议",self.child] userInfo:nil];
//            @throw exception;
//        }
//    }
//    return self;
//}

- (void)setApiManager:(CTAPIBaseManager *)apiManager {
    _apiManager = apiManager;
    _apiManager.delegate = self;
}


- (void)excute {
    [self.apiManager loadData];
}


#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager {
    if (manager == self.apiManager && [self.delegate respondsToSelector:@selector(commandDidSuccess:)]) {
        [self.delegate commandDidSuccess:self];
        if (self.next) {
            [self.next excute];
        }
    }
}

- (void)managerCallAPIDidFailed:(CTAPIBaseManager *)manager {
    if (manager == self.apiManager && [self.delegate respondsToSelector:@selector(commandDidFailed:)]) {
        [self.delegate commandDidFailed:self];
    }
}



@end
