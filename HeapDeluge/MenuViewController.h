//
//  MenuViewController.h
//  HeapDeluge
//
//  Created by William Richman on 11/14/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitionManager.h"

@interface MenuViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *questionsView;
@property (weak, nonatomic) IBOutlet UIView *usersView;
@property (weak, nonatomic) IBOutlet UIView *tagView;
@property (weak, nonatomic) IBOutlet UIView *profileView;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *loginView;

- (IBAction)unwindToViewController: (UIStoryboardSegue*) sender;

@end
