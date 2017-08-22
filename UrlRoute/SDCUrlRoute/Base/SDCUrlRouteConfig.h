//
//  SDCUrlRouteConfig.h
//  newCampus
//
//  Created by YYDD on 16/3/10.
//  Copyright © 2016年 com.campus.cn. All rights reserved.
//

#ifndef SDCUrlRouteConfig_h
#define SDCUrlRouteConfig_h


typedef enum
{
    kUrlRedirectPush = 1,   /**< push操作 */
    kUrlRedirectPop = 2,    /**< pop操作 */
    kUrlRedirectPresent = 3,    /**< present 操作 */
    kUrlRedirectDismiss = 4,    /**< dismissViewController 操作 */
}UrlRedirectType;




#define SDCRoutePushToVC(ViewController,beAnimated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
NSAssert(nav != nil,@"****just UINavigationController can use push and pop****");\
[nav pushViewController:ViewController animated:beAnimated];


#define SDCRoutePopVC(beAnimated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
NSAssert(nav != nil,@"****just UINavigationController can use push and pop****");\
[nav popViewControllerAnimated:beAnimated]



#define SDCRoutePopToRoot(beAnimated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
NSAssert(nav != nil,@"****just UINavigationController can use push and pop****");\
[nav popToRootViewControllerAnimated:beAnimated];



#define SDCRoutePopToVC(ViewController,beAnimated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
NSAssert(nav != nil,@"****just UINavigationController can use push and pop****");\
[nav popToViewController:ViewController animated:beAnimated];



#define SDCRoutePresentToVC(ViewController,beAnimated)\
UINavigationController *nv=[[UINavigationController alloc]initWithRootViewController:ViewController];\
[[UIApplication sharedApplication].currentViewController presentViewController:nv animated:beAnimated completion:nil];


#define SDCRouteDismissToVC(beAnimated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
if(nav == nil){[[UIApplication sharedApplication].currentViewController dismissViewControllerAnimated:beAnimated completion:nil];}else{[[UIApplication sharedApplication].currentViewController.navigationController dismissViewControllerAnimated:beAnimated completion:nil];}\







/**
 app内跳转scheme

 @return schemekey
 */
#define LocalRouteUrlPrefix [SDCUrlRouteData sharedData].localRouteUrlScheme


/**
 app外跳转scheme

 @return schemekey
 */
#define ThirdRouteUrlPrefix [SDCUrlRouteData sharedData].thirdRouteUrlScheme


//配置跳转的key
#define RouteToTestVC               @"toTestVC" /**<进入测试页面 */
#define RouteToTestWeb              @"toTestWeb"    /**< 进入测试的网页 */




#endif /* SDCUrlRouteConfig_h */
