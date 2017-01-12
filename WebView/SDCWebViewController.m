//
//  SDCWebViewController.m
//  UrlRouteSample
//
//  Created by YYDD on 2017/1/12.
//  Copyright © 2017年 com.shudong.urlRoute. All rights reserved.
//

#import "SDCWebViewController.h"

@interface SDCWebViewController ()<UIWebViewDelegate>

@property(nonatomic,weak)UIWebView *webView;

@end

@implementation SDCWebViewController

-(void)viewDidLoad {
 
    [super viewDidLoad];
    
    self.title = self.titleStr;
    
    [self initWebView];
}

-(void)initWebView
{
    
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = self.view.bounds;
    webView.backgroundColor = [UIColor clearColor];
    webView.scalesPageToFit = YES;
    webView.delegate = self;
    [self.view addSubview:webView];
    _webView = webView;
    
    if (_urlStr) {
        
        
        NSURL *url=[NSURL URLWithString:_urlStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];
        
        [webView loadRequest:request];
        [webView setScalesPageToFit:YES];
    }else
    {
        NSLog(@"没有url 加载失败");
    }
    
    
}

#pragma mark - WebView Delegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"%s",__func__);
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"%s",__func__);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%s",__func__);
}

@end
