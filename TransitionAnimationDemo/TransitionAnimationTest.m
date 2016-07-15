//
//  TransitionAnimationTest.m
//  TransitionAnimationDemo
//
//  Created by Karl on 16/7/13.
//  Copyright © 2016年 Shixi.com. All rights reserved.
//

#import "TransitionAnimationTest.h"

@implementation TransitionAnimationTest

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    //动画持续时间
    return 0.4f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //动画主体:180°翻盖效果转场
    _transitionContext = transitionContext;
    //先获取controller
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //设置锚点
    toViewController.view.layer.anchorPoint = CGPointMake(1, 0.5);
    //重新设置position
    toViewController.view.center = CGPointMake(CGRectGetMaxX(fromViewController.view.frame), CGRectGetMidY(fromViewController.view.frame));
    //view容器
    UIView *container = transitionContext.containerView;
    //添加view
    [container addSubview:fromViewController.view];
    [container addSubview:toViewController.view];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1/2000;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.duration = [self transitionDuration:transitionContext];
    animation.fromValue = @(M_PI_2);
    animation.toValue = @(0);
    animation.delegate = self;
    [toViewController.view.layer addAnimation:animation forKey:@"rotationAnimation"];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //用来获得动画结束的通知
    if (flag) {
        [_transitionContext completeTransition:YES];
    }
}
@end
