//
//  User.h
//  HeapDeluge
//
//  Created by William Richman on 11/11/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger userID;
@property (nonatomic, strong) NSString *imageURL;

- (instancetype) initWithDictionary: (NSDictionary *) userDict;

@end
