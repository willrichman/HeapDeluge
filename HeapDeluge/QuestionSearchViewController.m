//
//  QuestionSearchViewController.m
//  HeapDeluge
//
//  Created by William Richman on 11/11/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import "QuestionSearchViewController.h"
#import "Question.h"
#import "QuestionCell.h"

@interface QuestionSearchViewController ()

@property (nonatomic, strong) NSMutableArray *questionsArray;

@end

@implementation QuestionSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.searchBar.delegate = self;
}

#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.questionsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuestionCell *cell = (QuestionCell *)[tableView dequeueReusableCellWithIdentifier:@"QUESTION_CELL" forIndexPath:indexPath];
    Question *questionToDisplay = self.questionsArray[indexPath.row];
    cell.title.text = questionToDisplay.title;
    return cell;
}

#pragma mark UISearchBarDelegate methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSData *questionsData = [NSData dataWithContentsOfFile:(@"/Users/wrichman/Desktop/repos/HeapDeluge/HeapDeluge/SampleQuestion.json")];
    self.questionsArray = [Question parseJSONDataIntoQuestions: questionsData];
    [self.tableView reloadData];
}

@end
