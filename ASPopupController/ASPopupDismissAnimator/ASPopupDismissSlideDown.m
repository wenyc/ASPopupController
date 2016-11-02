//
//  ASPopupDismissSlideDown.m
//  ASPopupController
//
//  Created by Cyrus on 16/3/26.
//  Copyright © 2016年 Cyrus. All rights reserved.
//

#import "ASPopupDismissSlideDown.h"
#import "ASPopupController.h"

@implementation ASPopupDismissSlideDown
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    ASPopupController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.alertView.center = CGPointMake(fromVC.view.center.x, fromVC.view.frame.size.height + fromVC.alertView.frame.size.height/2.0);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}
@end