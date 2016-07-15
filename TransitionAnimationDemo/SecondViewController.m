//
//  SecondViewController.m
//  TransitionAnimationDemo
//
//  Created by Karl on 16/7/13.
//  Copyright © 2016年 Shixi.com. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UINavigationControllerDelegate>{
    
    UIScreenEdgePanGestureRecognizer *pan;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
//    self.navigationController.delegate = self;
//    pan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
//    pan.edges = UIRectEdgeLeft;
//    [self.view addGestureRecognizer:pan];
    
}

//- (void)handlePanGesture:(UIScreenEdgePanGestureRecognizer *)sender{
//    switch (sender.state) {
//        case UIGestureRecognizerStateBegan:
//            
//            break;
//            
//        default:
//            break;
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
