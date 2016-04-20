//
//  UIApplication+CurrentViewController.m
//  campus
//
//  Created by Kael on 8/13/15.
//  Copyright (c) 2015 com.treeholeapp.campus. All rights reserved.
//

#import "UIApplication+CurrentViewController.h"
#import <objc/runtime.h>

@implementation UIApplication (CurrentViewController)

-(void)setCurrentViewController:(UIViewController *)currentViewController
{
    objc_setAssociatedObject(self, @selector(currentViewController), currentViewController, OBJC_ASSOCIATION_ASSIGN);
}

-(UIViewController *)currentViewController
{
    return objc_getAssociatedObject(self, _cmd);
}

@end
