//
//  LoginData.h
//  timur_proj
//
//  Created by Vladislav Popov on 6/8/18.
//  Copyright © 2018 Timur Khamzin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginData : NSObject <NSCoding>

@property (strong, nonatomic) NSString* url;
@property (strong, nonatomic) NSString* login;
@property (strong, nonatomic) NSString* password;

@end

NS_ASSUME_NONNULL_END
