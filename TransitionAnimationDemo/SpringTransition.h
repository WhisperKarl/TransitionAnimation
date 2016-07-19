//
//  SpringTransition.h
//  TransitionAnimationDemo
//
//  Created by Karl on 16/7/19.
//  Copyright © 2016年 Shixi.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SpringTransitionType) {
    SpringTransitionTypePresent = 0,
    SpringTransitionTypeDismiss
};
@interface SpringTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transiontWithTransitionType:(SpringTransitionType)type;

@end
