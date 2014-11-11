//
//  QuestionCell.h
//  HeapDeluge
//
//  Created by William Richman on 11/11/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *title;
@property (nonatomic, weak) IBOutlet UILabel *answerCount;

@end
