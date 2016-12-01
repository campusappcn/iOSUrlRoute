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
    objc_setAssociatedObject(self, @selector(currentViewController), currentViewController, OBJC_ASSOCIATION_ASSIGN);
}

-(UIViewController *)currentViewController
{
    return objc_getAssociatedObject(self, _cmd);
}

@end
