//
//  NetworkController.h
//  HeapDeluge
//
//  Created by William Richman on 11/10/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkController : NSObject

@property (nonatomic, strong) NSString *token;

+ (id)controller;

- (void)fetchQuestions:(NSString *) tag completionHandler: (void (^)(NSString *, NSMutableArray *))completionHandler;

@end
