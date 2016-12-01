//
//  SDCUrlRouteCenter+ToRoot.m
//  newCampus
//
//  Created by YYDD on 16/5/12.
//  Copyright © 2016年 com.campus.cn. All rights reserved.
//

#import "SDCUrlRouteCenter+ToRoot.h"
#import <objc/runtime.h>
#import "SDCUrlRouteData.h"
#import "SDCUrlRouteConfig.h"
#import "UIApplication+SDCUrlRoute.h"

@implementation SDCUrlRouteCenter (ToRoot)

-(void)openRoot:(NSString *)urlkey
{
    
    Class class = [[SDCUrlRouteData sharedData]classFromUrlKey:urlkey];
    SDCRoutePopToRoot(NO);
    
    id vc=[UIApplication sharedApplication].keyWindow.rootViewController;
    if ([vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tab=(UITabBarController *)vc;
        
        for (UINavigationController *nav in tab.viewControllers) {
            
            UIViewController *navRootVC = [nav.childViewControllers firstObject];
            if ([navRootVC isKindOfClass:class]) {
                NSInteger index = [tab.viewControllers indexOfObject:nav];
                [tab setSelectedIndex:index];
            }
        }
    }
    
}



@end
