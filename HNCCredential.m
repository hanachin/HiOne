//
//  HiCredential.m
//  HiOne
//
//  Created by Seiei Higa on 2014/07/26.
//  Copyright (c) 2014年 Seiei Higa. All rights reserved.
//

#import "HNCCredential.h"

@implementation HNCCredential

- (NSString *)base64
{
    NSString *basic = [NSString stringWithFormat:@"%@:%@", [self username], [self password]];
    NSData *data = [basic dataUsingEncoding:NSUTF8StringEncoding];
    NSString *encoded = [data base64EncodedStringWithOptions: NSDataBase64Encoding64CharacterLineLength];
    return encoded;
}

- (NSString *)username
{
    return [[self hiDefaults] stringForKey:@"username"];
}

- (NSString *)password
{
    return [[self hiDefaults] stringForKey:@"password"];
}

- (NSUserDefaults *)hiDefaults
{
    NSUserDefaults *hiDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *defaults = @{
        @"username": @"hi",
        @"password": @"hi"
    };
    [hiDefaults registerDefaults: defaults];
    return hiDefaults;
}
@end
