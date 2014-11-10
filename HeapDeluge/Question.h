//
//  Question.h
//  HeapDeluge
//
//  Created by William Richman on 11/10/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSString *ownerID;
@property (nonatomic, strong) NSString *ownerName;
@property (nonatomic, strong) NSArray *tags;

+ (NSArray *)parseJSONDataIntoQuestions: (NSData *) rawJSONData;

@end