//
//  SDCUrlRouteCenter.m
//  newCampus
//
//  Created by YYDD on 16/3/10.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import "SDCUrlRouteCenter.h"
#import "SDCUrlRouteData.h"

#import "UIApplication+SDCUrlRoute.h"

#import "SDCWebManager.h"
#import "SDCUrlRouteCenter_Config.h"

NSString* localRouteUrl(NSString *routekey) {
    return [LocalRouteUrlPrefix stringByAppendingString:routekey];
}

//NSString* encodeKeyInNecessary(NSString *key) {
//    return [key stringByAppendingString:@"|M"];
//}
//
//NSString* decodeKeyInNecessary(NSString *key) {
//    
//    if (![key hasSuffix:@"|M"]) {
//        return key;
//    }
//    return [key substringToIndex:(key.length - 2 - 1)];
//}
//
//
//BOOL keyIsNecessary(NSString *key) {
//
//    if ([key hasSuffix:@"|M"]) {
//        return YES;
//    }
//    return NO;
//}



@implementation SDCUrlRouteCenter

+(SDCUrlRouteCenter *)sharedCenter
{
    static SDCUrlRouteCenter *urlRouteCenter = nil;
    if (urlRouteCenter == nil)
    {
        urlRouteCenter = [[self alloc]init];
    }
    return urlRouteCenter;
}

-(instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}


-(void)open:(NSString *)urlkey animated:(BOOL)animated
{
    [self open:urlkey animated:animated URLRedirectType:kUrlRedirectPush];
}

-(void)open:(NSString *)urlkey animated:(BOOL)animated URLRedirectType:(UrlRedirectType)type
{
    [self open:urlkey animated:animated URLRedirectType:type extraParams:nil];
}

-(void)open:(NSString *)urlkey animated:(BOOL)animated extraParams:(NSDictionary *)extraParams
{
    [self open:urlkey animated:animated URLRedirectType:kUrlRedirectPush extraParams:extraParams];
}

-(void)open:(NSString *)urlkey animated:(BOOL)animated URLRedirectType:(UrlRedirectType)type extraParams:(NSDictionary *)extraParams
{
    if ([urlkey isKindOfClass:[NSURL class]]) {
       urlkey = [((NSURL *)urlkey) absoluteString];
    }
    
    if ([[SDCUrlRouteData sharedData] isWebUrl:urlkey]) {
        //判断当前的urlKey 是否是 网址
        
        NSString *urlStr = [[SDCUrlRouteData sharedData]findUrlWithUrlKey:urlkey extraParams:extraParams];
        [self goToWeb:urlStr animated:animated URLRedirectType:type];
    }else
    {
        if (!extraParams) {
            extraParams = [[SDCUrlRouteData sharedData] findParamsContainInUrlKey:urlkey];
        
        }
        UIViewController *vc = [[SDCUrlRouteData sharedData]findVCWithUrlKey:urlkey extraParams:extraParams];
        [self goToVC:vc animated:animated URLRedirectType:type];
    }
}



-(void)closeWithAnimated:(BOOL)animated
{
    [self close:nil animated:animated];
}

-(void)close:(NSString *)url animated:(BOOL)animated
{
    
    if ([UIApplication sharedApplication].currentViewController.navigationController && [UIApplication sharedApplication].currentViewController.navigationController.childViewControllers.count > 1) {
        
        //才可以理解为是popVC
        UIViewController *vc = [[SDCUrlRouteData sharedData]findVCWithUrlKey:url extraParams:nil];
        [self goToVC:vc animated:animated URLRedirectType:kUrlRedirectPop];
    }else
    {
        UIViewController *vc = [[SDCUrlRouteData sharedData]findVCWithUrlKey:url extraParams:nil];
        [self goToVC:vc animated:animated URLRedirectType:kUrlRedirectDismiss];
    }
}




#pragma mark Method
-(void)goToWeb:(NSString *)urlStr animated:(BOOL)animated URLRedirectType:(UrlRedirectType)type
{
    UIViewController *vc = [SDCWebManager createWebVCWithUrl:urlStr WithTitle:nil];
    [self goToVC:vc animated:YES URLRedirectType:kUrlRedirectPush];
}

-(void)goToVC:(UIViewController *)vc animated:(BOOL)animated URLRedirectType:(UrlRedirectType)type
{
    switch (type) {
        case kUrlRedirectPop:
            [self popToVC:vc animated:animated];
            break;
        case kUrlRedirectPush:
            [self pushToVC:vc animated:animated];
            break;
        case kUrlRedirectPresent:
            [self presentToVC:vc animated:animated];
            break;
        case kUrlRedirectDismiss:
            [self dismissToVC:vc animated:animated];
            break;
        default:
            [self goToErrorVC];
            break;
    }
}


-(void)popToVC:(UIViewController *)vc animated:(BOOL)animated
{
    if (!vc) {
        SDCRoutePopVC(animated);
    }else
    {
        SDCRoutePopToVC(vc, animated);
    }
}

-(void)pushToVC:(UIViewController *)vc animated:(BOOL)animated
{
    if (vc) {
        SDCRoutePushToVC(vc, animated);
    }else
    {
        [self goToErrorVC];
    }
}

-(void)presentToVC:(UIViewController *)vc animated:(BOOL)animated
{
    if (vc) {
        SDCRoutePresentToVC(vc, animated);
    }else
    {
        [self goToErrorVC];
    }

}
   
-(void)dismissToVC:(UIViewController *)vc animated:(BOOL)animated
{
    SDCRouteDismissToVC(animated);
}




-(void)goToErrorVC
{
    NSLog(@"goToErrorVC");
}




+(void)addRoutePlistFilePath:(NSString *)filePath {

    [[SDCUrlRouteData sharedData] addMappingFilePath:filePath];
}


+(void)addLocalRouteUrlScheme:(NSString *)schemeKey {

    [SDCUrlRouteData sharedData].localRouteUrlScheme = schemeKey;
}

+(void)addThirdRouteUrlScheme:(NSString *)schemeKey {

    [SDCUrlRouteData sharedData].thirdRouteUrlScheme = schemeKey;
}


         
@end
