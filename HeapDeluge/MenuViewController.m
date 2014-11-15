//
//  MenuViewController.m
//  HeapDeluge
//
//  Created by William Richman on 11/14/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@property (nonatomic, strong) TransitionManager *transitionManager;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.transitionManager = [[TransitionManager alloc] init];
}

- (IBAction)pressedQuestions:(id)sender {
}

- (IBAction)unwindToViewController: (UIStoryboardSegue*) sender{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // this gets a reference to the screen that we're about to transition to
    UIViewController *toViewController = segue.destinationViewController;
    
    // instead of using the default transition animation, we'll ask
    // the segue to use our custom TransitionManager object to manage the transition animation
    toViewController.transitioningDelegate = self.transitionManager;
}

@end
