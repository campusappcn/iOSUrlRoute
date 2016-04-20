//
//  CurrentViewController.m
//  campus
//
//  Created by Kael on 8/27/15.
//  Copyright (c) 2015 com.treeholeapp.campus. All rights reserved.
//

#import "CurrentViewController.h"
#import "UIApplication+CurrentViewController.h"

@implementation CurrentViewController

+(instancetype)createdRouteVCWithParams:(NSDictionary *)params
{
    CurrentViewController *vc = [[CurrentViewController alloc]init];
    return vc;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].currentViewController = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}



-(void)dealloc
{

}



@end