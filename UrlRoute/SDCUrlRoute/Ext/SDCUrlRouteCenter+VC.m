//
//  SDCUrlRouteCenter+VC.m
//  LaoBaiStore
//
//  Created by YYDD on 2016/12/29.
//  Copyright © 2016年 zyh. All rights reserved.
//

#import "SDCUrlRouteCenter+VC.h"
#import "SDCUrlRouteData.h"
#import "SDCWebManager.h"

#import "UIApplication+SDCUrlRoute.h"


@implementation SDCUrlRouteCenter (VC)


-(Class)findClass:(NSString *)urlKey {

    if ([[SDCUrlRouteData sharedData] isWebUrl:urlKey]) {
        return nil;
    }
    Class class = [[SDCUrlRouteData sharedData]classFromUrlKey:urlKey];
    return class;
    
}


-(UIViewController *)createViewControllerInMainTab:(NSString *)urlKey {
    
    return [self createViewControllerWithUrlKey:urlKey InMainTab:YES];
}


-(UIViewController *)createViewController:(NSString *)urlKey {

    return [self createViewControllerWithUrlKey:urlKey InMainTab:NO];
}


-(UIViewController *)createViewControllerWithUrlKey:(NSString *)urlKey InMainTab:(BOOL)mainTab {

    UIViewController *vc = nil;
    if ([[SDCUrlRouteData sharedData] isWebUrl:urlKey]) {
        
        NSString *urlStr = [[SDCUrlRouteData sharedData]findUrlWithUrlKey:urlKey extraParams:nil];
        
        vc = [SDCWebManager createWebVCWithUrl:urlStr WithTitle:nil];
        
    }else {
        vc = [[SDCUrlRouteData sharedData]findVCWithUrlKey:urlKey extraParams:nil];
    }
    
    return vc;
}


@end
