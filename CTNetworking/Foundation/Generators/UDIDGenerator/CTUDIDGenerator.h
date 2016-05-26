//
//  KeychainWrapper.h
//  CTAPIProxy
//
//  Created by liu lh on 13-6-24.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CTUDIDGenerator : NSObject

+ (id)sharedInstance;

- (NSString *)UDID;
- (void)saveUDID:(NSString *)udid;

@end
