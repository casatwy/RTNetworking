//
//  CLBasicCommand.m
//  CLNetWorkApiManager
//
//  Created by liang on 2017/8/11.
//  Copyright © 2017年 liang. All rights reserved.
//

#import "CLBasicCommand.h"

@implementation CLBasicCommand

#pragma mark publick method
- (void)execute {
    
    [self.apiManager loadData];
}

- (NSDictionary *)paramsForNextCommand:(CTAPIBaseManager *)apiManager {
    
    return nil;
}
#pragma mark - CTAPIManagerParamSource

- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager {
    
    if (self.params) {
        
        return self.params;
    }
    if ([self.dataSource respondsToSelector:@selector(paramsForcommand:)]) {
        
        return [self.dataSource paramsForcommand:self];
    }
    return nil;
}
#pragma mark - CTAPIManagerCallbackDelegate

- (void)managerCallAPIDidFailed:(CTAPIBaseManager *)manager {
    
    if ([self.delegate respondsToSelector:@selector(command:didFaildWith:)]) {
        
        [self.delegate command:self didFaildWith:manager];
    }
    
}

- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager {
    
    if (self.next) {
        
        if ([self.delegate respondsToSelector:@selector(command:successMessage:)]) {
            
            [self.delegate command:self successMessage:manager];
        }
        self.next.params = [self paramsForNextCommand:manager];
        [self.next execute];
        
    } else {
        
        if ([self.delegate respondsToSelector:@selector(command:didSuccess:)]) {
            
            [self.delegate command:self didSuccess:manager];
        }
    }
    
}

- (CTAPIBaseManager *)apiManager {
    
    NSParameterAssert(@"subclass must rewrite this method");
    return nil;
}
@end
