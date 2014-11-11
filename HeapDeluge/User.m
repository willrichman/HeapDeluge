//
//  User.m
//  HeapDeluge
//
//  Created by William Richman on 11/11/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype) initWithDictionary: (NSDictionary *) userDict {
    self = [super init];
    if (self) {
        self.name = userDict[@"display_name"];
        self.userID = [userDict[@"user_id"] integerValue];
        self.imageURL = userDict[@"profile_image"];
    }
    return self;
}

@end
