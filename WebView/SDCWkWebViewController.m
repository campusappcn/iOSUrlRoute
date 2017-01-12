//
//  SDCWkWebViewController.m
//  UrlRouteSample
//
//  Created by YYDD on 2017/1/12.
//  Copyright © 2017年 com.shudong.urlRoute. All rights reserved.
//

#import "SDCWkWebViewController.h"
#import <WebKit/WebKit.h>

@interface SDCWkWebViewController ()<WKNavigationDelegate,WKUIDelegate>

@property(nonatomic,weak)WKWebView *webView;
@property(nonatomic,weak)UIProgressView *progressView;

@end

@implementation SDCWkWebViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.titleStr;
    [self initWebView];
}

-(void)initWebView
{
    WKWebView *webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    webView.allowsBackForwardNavigationGestures = YES;
    webView.UIDelegate = self;
    _webView = webView;
    
    UIProgressView *progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, webView.frame.size.width, 10)];
    [webView addSubview:progressView];
    [progressView setAlpha:0];
    progressView.backgroundColor = [UIColor clearColor];
    progressView.progressTintColor = [UIColor blueColor];
    progressView.trackTintColor = [UIColor clearColor];
    _progressView = progressView;
    
    if (_urlStr) {
        
        NSURL *url=[NSURL URLWithString:_urlStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];
        
        [webView loadRequest:request];
        
    }
}


#pragma mark - WebView Delegate
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    NSLog(@"%s",__func__);
}

-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    NSLog(@"%s",__func__);
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    NSLog(@"%s",__func__);
    self.title = _webView.title;
    
}

-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"%s",__func__);
}

#pragma mark - Progress KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        if (object == _webView) {
            [_progressView setAlpha:1.0f];
            [_progressView setProgress:_webView.estimatedProgress animated:YES];
            
            if(_webView.estimatedProgress >= 1.0f) {
                
                [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    [_progressView setAlpha:0.0f];
                } completion:^(BOOL finished) {
                    [_progressView setProgress:0.0f animated:NO];
                }];
                
            }
        }
        else
        {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
        
    }
}


-(void)dealloc
{
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action) {
                                                          completionHandler();
                                                      }]];
    [self presentViewController:alertController animated:YES completion:^{}];
    
}



- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    decisionHandler(WKNavigationResponsePolicyAllow);
    
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    
    if ([navigationAction.request.URL.absoluteString hasPrefix:@"itms-services://"]) {
        [[UIApplication sharedApplication]openURL:navigationAction.request.URL];
        decisionHandler(WKNavigationActionPolicyCancel);
    }else
    {
        // 允许跳转
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}


@end
