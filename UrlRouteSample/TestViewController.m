//
//  TestViewController.m
//  UrlRouteSample
//
//  Created by YYDD on 16/3/22.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import "TestViewController.h"

#import "SDCUrlRoute.h"

@interface TestViewController()

@property(nonatomic,strong)NSString *valueStr;

@end

@implementation TestViewController

+(instancetype)createdRouteVCWithParams:(NSDictionary *)params
{
    
    [super createdRouteVCWithParams:params];
    
    TestViewController *vc = [[TestViewController alloc]init];
    if (params) {
        NSString *str = params[@"key"];
        vc.valueStr = str;
    }
    return vc;

}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];


    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(back)];

    self.navigationItem.leftBarButtonItem = item;
    
    
    if (self.valueStr) {
        UILabel *label = [[UILabel alloc]init];
        [label setText:self.valueStr];
        [label setFont:[UIFont systemFontOfSize:32]];
        [label sizeToFit];
        label.center = self.view.center;
        [self.view addSubview:label];
    }
    
    
}

-(void)back
{
    [[SDCUrlRouteCenter sharedCenter]closeWithAnimated:YES];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    if (self.routeReCallBlock) {
        self.routeReCallBlock(self.valueStr);
    }

}





@end
