//
//  ViewController.m
//  UrlRouteSample
//
//  Created by YYDD on 16/3/22.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import "ViewController.h"
#import "SDCUrlRoute.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

+(instancetype)createdRouteVCWithParams:(NSDictionary *)params
{
    ViewController *vc = [[ViewController alloc]init];
    return vc;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc]init];
    tableView.frame = self.view.frame;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//
//}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    NSString *title = nil;
    switch (indexPath.row) {
        case 0:
            title = @"普通push跳转";
            break;
        case 1:
            title = @"普通present跳转";
            break;
        case 2:
            title = @"push跳转-传值";
            break;
        case 3:
            title = @"present跳转-传值";
            break;
        case 4:
            title = @"跳转网页";
            break;
        case 5:
            title = @"push跳转-传值-有返回参数";
            break;
        case 6:
            title = @"present跳转-传值-有返回参数";
            break;
        case 7:
            title = @"跳转非法、不存在的地址";
            break;
        default:
            break;
    }
    
    cell.textLabel.text = title;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES];
        }
            break;
        case 1:
        {
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES URLRedirectType:kUrlRedirectPresent];
        }
            break;
        case 2:
        {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"hello Test1",@"key", nil];
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES extraParams:dict];
        }
            break;
        case 3:
        {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"hello Test2",@"key", nil];
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES URLRedirectType:kUrlRedirectPresent extraParams:dict];
        }
            break;
        case 4:
        {
//            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestWeb) animated:YES];
            [[SDCUrlRouteCenter sharedCenter]open:@"http://www.baidu.com" animated:YES];
        }
            break;
        case 5:
        {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"hello Test1 Call Back",@"key", nil];
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES extraParams:dict WithReloadBlock:^(id customValue) {
               
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:customValue delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alertView show];
                
            }];
            
        }
            break;
        case 6:
        {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"hello Test1 Call Back",@"key", nil];
            
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES URLRedirectType:kUrlRedirectPresent extraParams:dict WithReloadBlock:^(id customValue) {
                
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:customValue delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alertView show];

            }];
        }
            break;
        case 7:
        {
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(@"helloworld") animated:YES];
        }
            break;
        default:
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
