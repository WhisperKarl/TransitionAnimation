//
//  SpringAnimationController.m
//  TransitionAnimationDemo
//
//  Created by Karl on 16/7/19.
//  Copyright © 2016年 Shixi.com. All rights reserved.
//

#import "SpringAnimationController.h"
#import "SpringSecondController.h"
#import "SpringTransition.h"

@interface SpringAnimationController ()

@end

@implementation SpringAnimationController


- (void)awakeFromNib{
    
    self.modalPresentationStyle = UIModalPresentationCustom;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presentAction:(id)sender {
    
    SpringSecondController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SpringSecond"];
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return  [SpringTransition transiontWithTransitionType:SpringTransitionTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [SpringTransition transiontWithTransitionType:SpringTransitionTypeDismiss];
}

- (void)viewDidDisappear:(BOOL)animated{
    
    NSLog(@"销毁");
}


@end
