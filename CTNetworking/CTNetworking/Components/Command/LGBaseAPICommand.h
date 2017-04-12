//
//  LGBaseAPICommand.h
//  CTNetworking
//
//  Created by Corotata on 2017/4/12.
//  Copyright © 2017年 Corotata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTAPIBaseManager.h"
@class LGBaseAPICommand;

@protocol CTAPICommandDelegate <NSObject>

@required
- (void)commandDidSuccess:(LGBaseAPICommand *)command;
- (void)commandDidFailed:(LGBaseAPICommand *)command;

@end



@protocol CTAPICommand <NSObject>

//- (void)excute;

@end

@interface LGBaseAPICommand : NSObject

@property (nonatomic, weak) id<CTAPICommandDelegate> delegate;
@property (nonatomic, strong) LGBaseAPICommand *next;
@property (nonatomic, strong) CTAPIBaseManager *apiManager;
//@property (nonatomic, weak) id<CTAPICommand> child;


- (void)excute;


@end
