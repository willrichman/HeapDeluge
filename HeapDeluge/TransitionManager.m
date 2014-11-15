//
//  TransitionManager.m
//  HeapDeluge
//
//  Created by William Richman on 11/14/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import "TransitionManager.h"

@interface TransitionManager()

@property (nonatomic) BOOL presenting;

@end

@implementation TransitionManager

#pragma mark UIViewControllerContextTransitioning methods

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

    // get reference to our fromView, toView and the container view that we should perform the transition in
    UIView *container = [transitionContext containerView];
    
    // create variables for our screens
    UIViewController *fromScreen = [transitionContext viewControllerForKey:(UITransitionContextFromViewControllerKey)];
    UIViewController *toScreen = [transitionContext viewControllerForKey:(UITransitionContextToViewControllerKey)];
    
    // assign references to our menu view controller and the 'bottom' view controller from the tuple
    // remember that our menuViewController will alternate between the from and to view controller depending if we're presenting or dismissing
    MenuViewController *menuViewController;
    QuestionSearchViewController *questionViewController;
    UIView *menuView;
    UIView *questionView;
    
    if (self.presenting) {
        menuViewController = (MenuViewController*)fromScreen;
        questionViewController = (QuestionSearchViewController*) toScreen;
        menuView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        questionView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    } else {
        menuViewController = (MenuViewController*)toScreen;
        questionViewController = (QuestionSearchViewController*) fromScreen;
        menuView = [transitionContext viewForKey:UITransitionContextToViewKey];
        questionView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    }
    
    // add the both views to our view controller
    if (self.presenting) {
        questionView.frame = menuView.frame;
        [container insertSubview:questionView belowSubview:menuView];
    } else {
        [container insertSubview:menuView aboveSubview:questionView];
    }
    
    // setup 2D transitions for animations
    CGAffineTransform offstageLeft = CGAffineTransformMakeTranslation(-200, 0);
    CGAffineTransform offstageRight = CGAffineTransformMakeTranslation(200, 0);
    CGAffineTransform loginOffstage = CGAffineTransformMakeTranslation(300, 0);
    CGAffineTransform offstageTop = CGAffineTransformMakeTranslation(0, -150);
    
    // prepare the menu
    if (!self.presenting) {
        
        // prepare menu to fade in
        menuView.backgroundColor = [menuView.backgroundColor colorWithAlphaComponent:0.0];
       
        // prepare menu items to slide in
        menuViewController.titleView.transform = offstageTop;
        menuViewController.loginButton.transform = loginOffstage;
        
        menuViewController.questionsView.transform = offstageLeft;
        menuViewController.usersView.transform = offstageLeft;
        
        menuViewController.tagView.transform = offstageRight;
        menuViewController.profileView.transform = offstageRight;
        menuViewController.loginView.backgroundColor = [menuViewController.loginView.backgroundColor colorWithAlphaComponent:0.0];
        
        questionView.alpha = 1;
        
    } else {
        questionViewController.backButton.transform = offstageLeft;
        menuViewController.loginView.backgroundColor = [menuViewController.loginView.backgroundColor colorWithAlphaComponent:1.0];
    }
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // perform the animation!
    [UIView animateWithDuration:duration delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (!self.presenting){
            // fade in
            menuView.backgroundColor = [menuView.backgroundColor colorWithAlphaComponent:1.0];
            questionView.alpha = 0;
            
            // offstage items: slide in
            menuViewController.titleView.transform = CGAffineTransformIdentity;
            menuViewController.loginButton.transform = CGAffineTransformIdentity;
            
            menuViewController.questionsView.transform = CGAffineTransformIdentity;
            menuViewController.usersView.transform = CGAffineTransformIdentity;
            
            menuViewController.tagView.transform = CGAffineTransformIdentity;
            menuViewController.profileView.transform = CGAffineTransformIdentity;
            
            // onstage items: slide out
            questionViewController.backButton.transform = offstageLeft;
            menuViewController.loginView.backgroundColor = [menuViewController.loginView.backgroundColor colorWithAlphaComponent:1.0];
            
        }
        else {
            
            menuView.backgroundColor = [menuView.backgroundColor colorWithAlphaComponent:0.0];
            
            //slide out
            menuViewController.titleView.transform = offstageTop;
            menuViewController.loginButton.transform = loginOffstage;
            
            menuViewController.questionsView.transform = offstageLeft;
            menuViewController.usersView.transform = offstageLeft;
            
            menuViewController.tagView.transform = offstageRight;
            menuViewController.profileView.transform = offstageRight;
            
            //slide in
            questionViewController.backButton.transform = CGAffineTransformIdentity;
            menuViewController.loginView.backgroundColor = [menuViewController.loginView.backgroundColor colorWithAlphaComponent:0.0];
        }
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition: YES];
        if (self.presenting) {
            [[UIApplication sharedApplication].keyWindow addSubview: questionView];
        }
    }];
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.75;
}

#pragma mark UIViewControllerTransitioningDelegate protocol methods

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.presenting = NO;
    return self;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.presenting = YES;
    return self;
}

@end
