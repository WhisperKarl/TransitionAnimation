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
 
    //先拿到fromVC和toVC, fromVC就是要推次级页的控制器,toVC就是被推出的控制器
    UINavigationController *nav = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    QQFirstViewController *fromViewController = (QQFirstViewController *)nav.topViewController;
    QQSecondViewController *toViewController = (QQSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //containerView 是承载过度动画过程中各个view的一层View
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    //把FirstVC的小周杰伦图片进行截图,然后隐藏原图片,这样我们只需要对截图进行操作就可以
    UIView *smallImageSnapshot = [fromViewController.smallZhouJieLun snapshotViewAfterScreenUpdates:YES];
    //截图的初始坐标为小图的位置,由于我们要把截图加到containerView上,所以我们要通过这个方法进行坐标转化,把相对于深色条(vackView)的坐标转化为相对于containerView的坐标
    smallImageSnapshot.frame = [containerView convertRect:fromViewController.smallZhouJieLun.frame fromView:fromViewController.backView];
    fromViewController.smallZhouJieLun.hidden = YES;
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    //先隐藏toVC,动画完成后再显示出来
    toViewController.view.alpha = 0;
    toViewController.bigImageView.hidden = YES;
    //根据图层关系把toVC.view和截图先后加到containerView上
    [containerView addSubview:toViewController.view];
    [containerView addSubview:smallImageSnapshot];

    //开始动画
    [UIView animateWithDuration:duration animations:^{
        //显示toVC.view
        toViewController.view.alpha = 1.0f;
        //获取新的frame,即大图的相对于containerView的坐标,并赋给截图
        CGRect frame = [containerView convertRect:toViewController.bigImageView.frame fromView:toViewController.view];
        smallImageSnapshot.frame = frame;
        
    } completion:^(BOOL finished) {
        //显示大图
        toViewController.bigImageView.hidden = NO;
        //小图要显示出来,否则pop后会消失
        fromViewController.smallZhouJieLun.hidden = NO;
        //隐藏截图
        [smallImageSnapshot removeFromSuperview];
        //完成动画
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
}

@end
