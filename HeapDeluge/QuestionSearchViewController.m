//
//  QuestionSearchViewController.m
//  HeapDeluge
//
//  Created by William Richman on 11/11/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import "QuestionSearchViewController.h"
#import "Question.h"

@interface QuestionSearchViewController ()

@end

@implementation QuestionSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    //cell.textLabel.text = self.people[indexPath.row];
    return cell;
}

@end
