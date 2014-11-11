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
    self = [super init];
    if (self != nil) {
        self.firstLaunch = YES;
    }
    self.firstLaunch = YES;
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
