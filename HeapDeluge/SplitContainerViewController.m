//
//  SplitContainerViewController.m
//  HeapDeluge
//
//  Created by William Richman on 11/11/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import "SplitContainerViewController.h"
#import "MenuTableViewController.h"

@interface SplitContainerViewController ()

@property (nonatomic, weak) MenuTableViewController *menuVC;

@end

@implementation SplitContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISplitViewController *splitVC = self.childViewControllers[0];
    splitVC.delegate = self;
    UINavigationController *navVC = splitVC.childViewControllers[0];
    self.menuVC = navVC.childViewControllers[0];
    self.menuVC.firstLaunch = YES;
}

#pragma mark UISplitViewControllerDelete methods

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if (_menuVC.firstLaunch == YES) {
        _menuVC.firstLaunch = NO;
        return YES;
    }
    return NO;
}

@end
