//
//  QQSecondViewController.m
//  TransitionAnimationDemo
//
//  Created by Karl on 16/7/14.
//  Copyright © 2016年 Shixi.com. All rights reserved.
//

#import "QQSecondViewController.h"

@interface QQSecondViewController ()

@end

@implementation QQSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.bigImageView = [[UIImageView alloc] init];
    self.bigImageView.frame = CGRectMake(0, 0, 200, 200);
    self.bigImageView.center = self.view.center;
    self.bigImageView.image = [UIImage imageNamed:@"封面.jpg"];
    self.bigImageView.layer.cornerRadius = self.bigImageView.frame.size.width / 2;
    [self.view addSubview:self.bigImageView];
}
- (IBAction)dismissBtnAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

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
