//
//  QQFirstViewController.m
//  TransitionAnimationDemo
//
//  Created by Karl on 16/7/14.
//  Copyright © 2016年 Shixi.com. All rights reserved.
//

#import "QQFirstViewController.h"
#import "QQSecondViewController.h"
#import "QQTransitionToSecond.h"
#import "QQTransitionBackToFirst.h"
@interface QQFirstViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation QQFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [[QQTransitionBackToFirst alloc] init];
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return  [[QQTransitionToSecond alloc] init];
}

- (IBAction)presentAction:(id)sender {
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    QQSecondViewController *vc = [story instantiateViewControllerWithIdentifier:@"QQSecond"];
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
