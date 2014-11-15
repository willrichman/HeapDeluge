//
//  TransitionManager.h
//  HeapDeluge
//
//  Created by William Richman on 11/14/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MenuViewController.h"
#import "QuestionSearchViewController.h"

@interface TransitionManager : NSObject <UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate>

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext;

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext;

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed;

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;

@end
