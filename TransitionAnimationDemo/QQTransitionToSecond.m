//
//  QQTransition.m
//  TransitionAnimationDemo
//
//  Created by Karl on 16/7/14.
//  Copyright © 2016年 Shixi.com. All rights reserved.
//

#import "QQTransitionToSecond.h"
#import "QQFirstViewController.h"
#import "QQSecondViewController.h"
@implementation QQTransitionToSecond

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.35f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
 
    UINavigationController *nav = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    QQFirstViewController *fromViewController = (QQFirstViewController *)nav.topViewController;
    QQSecondViewController *toViewController = (QQSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    UIView *smallImageSnapshot = [fromViewController.smallZhouJieLun snapshotViewAfterScreenUpdates:YES];
    smallImageSnapshot.frame = [containerView convertRect:fromViewController.smallZhouJieLun.frame fromView:fromViewController.backView];
    fromViewController.smallZhouJieLun.hidden = YES;
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.bigImageView.hidden = YES;
    [containerView addSubview:toViewController.view];
    [containerView addSubview:smallImageSnapshot];

    
    [UIView animateWithDuration:duration animations:^{
        toViewController.view.alpha = 1.0f;
        CGRect frame = [containerView convertRect:toViewController.bigImageView.frame fromView:toViewController.view];
        smallImageSnapshot.frame = frame;
        
    } completion:^(BOOL finished) {
        toViewController.bigImageView.hidden = NO;
        fromViewController.smallZhouJieLun.hidden = NO;
        [smallImageSnapshot removeFromSuperview];
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
}

@end
