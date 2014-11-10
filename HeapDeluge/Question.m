//
//  Question.m
//  HeapDeluge
//
//  Created by William Richman on 11/10/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import "Question.h"

@implementation Question

- (id)init: (NSDictionary *) jsonDict {
    if ((self = [super init])) {
        self.title = jsonDict[@"title"];
        if ((self.body = [jsonDict objectForKey:@"body"])) {
        }
        NSDictionary *owner = jsonDict[@"owner"];
        self.ownerID = owner[@"user_id"];
        self.ownerName = owner[@"display_name"];
        self.tags = jsonDict[@"tags"];
    }
    return self;
}

+ (NSMutableArray *)parseJSONDataIntoQuestions: (NSData *) rawJSONData {
    
    NSError *error = [[NSError alloc] init];
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:rawJSONData options: 0 error: &error];
    NSMutableArray *questions = [[NSMutableArray alloc] init];
    for (NSDictionary *question in JSONDictionary[@"items"]) {
        Question *newQuestion = [[Question alloc ]init: question];
        [questions addObject: newQuestion];
    }
    return questions;
}

@end
