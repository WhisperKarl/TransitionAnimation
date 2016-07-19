//
//  SpringSecondController.m
//  TransitionAnimationDemo
//
//  Created by Karl on 16/7/19.
//  Copyright © 2016年 Shixi.com. All rights reserved.
//

#import "SpringSecondController.h"

@interface SpringSecondController ()

@end

@implementation SpringSecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dismissAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
