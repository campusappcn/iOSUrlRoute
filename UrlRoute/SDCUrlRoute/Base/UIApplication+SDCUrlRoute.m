//
//  UIApplication+SDCUrlRoute.m
//  UrlRouteSample
//
//  Created by YYDD on 16/7/4.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import "UIApplication+SDCUrlRoute.h"
#import <objc/runtime.h>

@implementation UIApplication (SDCUrlRoute)

-(void)setCurrentViewController:(UIViewController *)currentViewController
{
    //补丁  怕addview之后
    if (!currentViewController.navigationController) {
        return;
    }
    
    objc_setAssociatedObject(self, @selector(currentViewController), currentViewController, OBJC_ASSOCIATION_ASSIGN);
}

-(UIViewController *)currentViewController
{
    UIViewController *vc=objc_getAssociatedObject(self, _cmd);
    if (vc==nil) {
        vc=[UIApplication topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
    }
    return vc;
}


+ (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}


@end
