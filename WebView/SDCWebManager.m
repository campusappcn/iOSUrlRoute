//
//  SDCWebManager.m
//  UrlRouteSample
//
//  Created by YYDD on 2017/1/12.
//  Copyright © 2017年 com.shudong.urlRoute. All rights reserved.
//

#import "SDCWebManager.h"
#import "SDCWebViewController.h"
#import "SDCWkWebViewController.h"


#define IOS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@implementation SDCWebManager

+(UIViewController *)createWebVCWithUrl:(NSString *)url WithTitle:(NSString *)title {
    
    if (title.length == 0) {
        title = @"网站";
    }
    
    if (IOS_8_OR_LATER) {
        //使用webkit
        SDCWkWebViewController *vc = [[SDCWkWebViewController alloc]init];
        vc.urlStr = url;
        vc.titleStr = title;
        return vc;
    }else
    {
        SDCWebViewController *vc = [[SDCWebViewController alloc]init];
        vc.urlStr = url;
        vc.titleStr = title;
        return vc;
    }
    
    return nil;
}


//+(void)goToWebViewWithUrl:(NSString *)url WithTitle:(NSString *)title
//{
//    
//    UIViewController *vc = [SDCWebManager createWebVCWithUrl:url WithTitle:title];
//    SDCRoutePushToVC(vc, YES);
//}





@end
