//
//  MenuTableViewController.m
//  HeapDeluge
//
//  Created by William Richman on 11/10/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import "MenuTableViewController.h"

@interface MenuTableViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation MenuTableViewController

- (instancetype)init {
    if ((self = [super init])) {
        self.firstLaunch = YES;
        self.tableView.rowHeight = 44;
    }
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
