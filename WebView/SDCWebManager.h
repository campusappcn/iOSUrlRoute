//
//  SDCWebManager.h
//  UrlRouteSample
//
//  Created by YYDD on 2017/1/12.
//  Copyright © 2017年 com.shudong.urlRoute. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDCWebManager : NSObject



/**
 push的方式

 @param url urlStr
 @param title 标题
 */
+(void)goToWebViewWithUrl:(NSString *)url WithTitle:(NSString *)title;



/**
 创建webview

 @param url url
 @param title title
 @return webview或者wkwebview
 */
+(UIViewController *)createWebVCWithUrl:(NSString *)url WithTitle:(NSString *)title;


@end
