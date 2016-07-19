//
//  SpringTransition.m
//  TransitionAnimationDemo
//
//  Created by Karl on 16/7/19.
//  Copyright © 2016年 Shixi.com. All rights reserved.
//

#import "SpringTransition.h"

@interface SpringTransition (){
    
    SpringTransitionType _type;
}

@end

@implementation SpringTransition

+ (instancetype)transiontWithTransitionType:(SpringTransitionType)type{
    
    return [[self alloc] initWithTransitionType:type
            ];
}

- (instancetype)initWithTransitionType:(SpringTransitionType)type{
    
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return _type == SpringTransitionTypePresent? 0.8 : 0.4;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    switch (_type) {
        case SpringTransitionTypePresent:
            [self presentAnimation:transitionContext];
            break;
        case SpringTransitionTypeDismiss:
            [self dismissAnimation:transitionContext];
            break;
    }
    
}

- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //获取转场前后两个控制器
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    
    UIView *snapView = [fromVc.view snapshotViewAfterScreenUpdates:NO];
    snapView.frame = fromVc.view.frame;
    fromVc.view.hidden = YES;
    [containerView addSubview:snapView];
    
    [containerView addSubview:toVc.view];
    
    toVc.view.frame = CGRectMake(0, containerView.bounds.size.height, containerView.bounds.size.width, 400);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1/0.55 options:0 animations:^{
        toVc.view.transform = CGAffineTransformMakeTranslation(0, -400);
        snapView.transform = CGAffineTransformMakeScale(0.88, 0.88);
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        
    }];
    
    
}

- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    UIView *snapView = [containerView.subviews objectAtIndex:0];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
       
        fromVc.view.transform = CGAffineTransformIdentity;
        snapView.transform = CGAffineTransformIdentity;
        
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        toVc.view.hidden = NO;
        [snapView removeFromSuperview];
    }];
    
    
}

@end
