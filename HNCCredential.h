//
//  HiCredential.h
//  HiOne
//
//  Created by Seiei Higa on 2014/07/26.
//  Copyright (c) 2014年 Seiei Higa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HNCCredential : NSObject

- (NSString *)base64;
- (NSString *)username;
- (NSString *)password;

@end
