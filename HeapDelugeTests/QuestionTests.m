//
//  QuestionTests.m
//  HeapDeluge
//
//  Created by William Richman on 11/12/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Question.h"

@interface QuestionTests : XCTestCase

@end

@implementation QuestionTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testParseData {
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"SampleQuestion.json"];
    NSData *jsonData = [NSData dataWithContentsOfFile: path];
    NSMutableArray *questionArray = [Question parseJSONDataIntoQuestions:jsonData];
    XCTAssertNotNil(questionArray);
    XCTAssertFalse([questionArray count] == 0);
    XCTAssertTrue([questionArray[0] isKindOfClass: [Question class]]);
}

@end
