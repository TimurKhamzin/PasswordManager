//
//  LoginData.m
//  timur_proj
//
//  Created by Vladislav Popov on 6/8/18.
//  Copyright © 2018 Timur Khamzin. All rights reserved.
//

#import "LoginData.h"

@implementation LoginData



- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:self.login forKey:@"login"];
    [coder encodeObject:self.password forKey:@"password"];
    [coder encodeObject:self.url forKey:@"url"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    self = [super init];
    if (self != nil)
    {
        self.login = [coder decodeObjectForKey:@"login"];
        self.password = [coder decodeObjectForKey:@"password"];
        self.url = [coder decodeObjectForKey:@"url"];
    }
    return self;
}

@end
