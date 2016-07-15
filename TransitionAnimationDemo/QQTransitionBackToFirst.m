//
//  QQTransitionBackToFirst.m
//  TransitionAnimationDemo
//
//  Created by Karl on 16/7/14.
//  Copyright © 2016年 Shixi.com. All rights reserved.
//

#import "QQTransitionBackToFirst.h"
#import "QQFirstViewController.h"
#import "QQSecondViewController.h"
@implementation QQTransitionBackToFirst

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.35;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UINavigationController *nav = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    QQFirstViewController *toViewController = (QQFirstViewController *)[nav topViewController];
    QQSecondViewController *fromViewController = (QQSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];;
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    UIView *bigImageSnapshot = [fromViewController.bigImageView snapshotViewAfterScreenUpdates:YES];
    bigImageSnapshot.frame = [containerView convertRect:fromViewController.bigImageView.frame fromView:fromViewController.view];
    
    fromViewController.bigImageView.hidden = YES;
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.smallZhouJieLun.hidden = YES;
    
    [containerView addSubview:nav.view];
    [containerView addSubview:bigImageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        toViewController.view.alpha = 1;
        
        CGRect frame = [containerView convertRect:toViewController.smallZhouJieLun.frame fromView:toViewController.backView];
        
        bigImageSnapshot.frame = frame;
        
    } completion:^(BOOL finished) {
        toViewController.smallZhouJieLun.hidden = NO;
        fromViewController.bigImageView.hidden = NO;
        [bigImageSnapshot removeFromSuperview];
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
}
@end
