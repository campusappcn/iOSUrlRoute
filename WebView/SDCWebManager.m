//
//  SDCWebManager.m
//  UrlRouteSample
//
//  Created by YYDD on 2017/1/12.
//  Copyright © 2017年 com.shudong.urlRoute. All rights reserved.
//

#import "SDCWebManager.h"

@implementation SDCWebManager

+(UIViewController *)createWebVCWithUrl:(NSString *)url WithTitle:(NSString *)title {
    
    return nil;
}


+(void)goToWebViewWithUrl:(NSString *)url WithTitle:(NSString *)title
{

    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:url]];
}





@end
