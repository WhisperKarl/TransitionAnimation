//
//  ViewController.m
//  TransitionAnimationDemo
//
//  Created by Karl on 16/7/13.
//  Copyright © 2016年 Shixi.com. All rights reserved.
//

#import "ViewController.h"
#import "TransitionAnimationTest.h"
@interface ViewController ()<UINavigationControllerDelegate>{

    UIScreenEdgePanGestureRecognizer *pan;
    UIPercentDrivenInteractiveTransition *interaction;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.delegate = self;
    
    pan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleScrenEdgePanGesture:)];
    pan.edges = UIRectEdgeRight;
    [self.view addGestureRecognizer:pan];
    
}

- (void)handleScrenEdgePanGesture:(UIScreenEdgePanGestureRecognizer *)sender{
    
    CGFloat progress = ((-1 *[sender translationInView:self.view].x ) / self.view.frame.size.width);
    NSLog(@"%f",progress);
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            interaction = [[UIPercentDrivenInteractiveTransition alloc] init];
            [self performSegueWithIdentifier:@"second" sender:nil];
            break;
        case UIGestureRecognizerStateChanged:
            [interaction updateInteractiveTransition:progress];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            
            if (progress > 0.5) {
                [interaction finishInteractiveTransition];
            }else{
                [interaction cancelInteractiveTransition];
            }
        }
            interaction = nil;
            break;
        default:
            break;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPush) {
        return [[TransitionAnimationTest alloc] init];
    }else
        return nil;
    
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    return interaction;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
