//
//  NetworkController.m
//  HeapDeluge
//
//  Created by William Richman on 11/10/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import "NetworkController.h"
#import "Question.h"

@interface NetworkController()

@property (nonatomic, strong) NSString *questionURLString;
@property (nonatomic, strong) NSString *key;

@end

@implementation NetworkController

- (instancetype)init {
    NSString *oAuthToken = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
    if ([oAuthToken isKindOfClass:[NSString class]] && (oAuthToken != nil)) {
        NSLog(@"Found saved OAuthToken");
        self.token = oAuthToken;
    } else {
        NSLog(@"No token found");
    }
    return self;
}

#pragma mark Singleton method

+ (id)controller {
    static NetworkController *controller = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        controller = [[self alloc] init];
    });
    return controller;
}

- (void)fetchQuestions:(NSString *) searchTerm completionHandler: (void (^)(NSString *, NSMutableArray *))completionHandler {
    self.questionURLString = @"https://api.stackexchange.com/2.2/search/advanced?order=desc&sort=votes&site=stackoverflow&q=";
    self.key = @"yK9v)QQXN4qVqTec1LztTg((";
    self.questionURLString = [self.questionURLString stringByAppendingString: searchTerm];
    if (self.token) {
        NSString *tokenAndKey = [NSString stringWithFormat:@"&access_token=%@&key=%@", self.token, self.key];
        self.questionURLString = [self.questionURLString stringByAppendingString:tokenAndKey];
    }
         
    NSURL *questionsURL = [NSURL URLWithString: self.questionURLString];

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
