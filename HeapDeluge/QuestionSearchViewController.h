//
//  QuestionSearchViewController.h
//  HeapDeluge
//
//  Created by William Richman on 11/11/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NSString-HTML/NSString+HTML.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface QuestionSearchViewController : UIViewController <UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end
