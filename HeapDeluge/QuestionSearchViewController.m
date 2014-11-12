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
#import "NetworkController.h"

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
    cell.answerCount.text = [NSString stringWithFormat:@"%li", (long)questionToDisplay.answers];
    cell.voteCount.text = [NSString stringWithFormat:@"%li", (long)questionToDisplay.score];
    if (questionToDisplay.answers > 0) {
        cell.answerView.backgroundColor = [UIColor colorWithRed:0 green:0.8 blue:0 alpha:0.8];
    }
    if (questionToDisplay.score > 0) {
        cell.voteView.backgroundColor = [UIColor colorWithRed:0 green:0.8 blue:0 alpha:0.8];
    }
    cell.username.text = questionToDisplay.ownerName;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd-yyyy"];
    cell.Date.text = [formatter stringFromDate:questionToDisplay.date];
    return cell;
}

#pragma mark UISearchBarDelegate methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [[NetworkController controller] fetchQuestions: self.searchBar.text completionHandler:^(NSString *error, NSMutableArray *questions) {
        self.questionsArray = questions;
        [self.tableView reloadData];
    }];
}

@end
