//
//  NetworkController.m
//  HeapDeluge
//
//  Created by William Richman on 11/10/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import "NetworkController.h"
#import "Question.h"

@implementation NetworkController

#pragma mark Singleton method

+ (id)controller {
    static NetworkController *controller = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        controller = [[self alloc] init];
    });
    return controller;
}

- (void)fetchQuestions:(NSString *) tag completionHandler: (void (^)(NSString *, NSMutableArray *))completionHandler {
    NSURL *questionsURL = [NSURL URLWithString: @"https://api.stackexchange.com/2.2/questions?site=stackoverflow"];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:questionsURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            if (error != nil) {
                // If there is an error in the web request, print to console
                NSLog(@"%@", [error localizedDescription]);
            } else {
                NSInteger statusCode = [httpResponse statusCode];
                if (statusCode >= 200 && statusCode <= 299) {
                    NSLog(@"Success!");
                    NSMutableArray *returnedArray = [Question parseJSONDataIntoQuestions:data];
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        completionHandler(nil, returnedArray);
                    }];
                } else {
                    NSLog(@"%@", [httpResponse description]);
                }
            }
    }];
    [task resume];
}

@end
