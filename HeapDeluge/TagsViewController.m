//
//  TagsViewController.m
//  HeapDeluge
//
//  Created by William Richman on 11/15/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import "TagsViewController.h"

@interface TagsViewController ()

@property (nonatomic, strong) NSArray *tagsArray;

@end

@implementation TagsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tagsArray = @[@"ios", @"ruby", @"javascript", @"css", @"mysql"];
    // Do any additional setup after loading the view.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tagsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TagCell *cell = (TagCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"TAG_CELL" forIndexPath:indexPath];
    cell.tagLabel.text = self.tagsArray[indexPath.row];
    return cell;
}

@end
