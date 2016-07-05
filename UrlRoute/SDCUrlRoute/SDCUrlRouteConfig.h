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




#define SDCRoutePushToVC(ViewController,animated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
NSAssert(nav != nil,@"****just UINavigationController can use push and pop****");\
[nav pushViewController:ViewController animated:animated];


#define SDCRoutePopVC(animated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
NSAssert(nav != nil,@"****just UINavigationController can use push and pop****");\
[nav popViewControllerAnimated:animated]



#define SDCRoutePopToRoot(animated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
NSAssert(nav != nil,@"****just UINavigationController can use push and pop****");\
[nav popToRootViewControllerAnimated:animated];



#define SDCRoutePopToVC(ViewController,animated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
NSAssert(nav != nil,@"****just UINavigationController can use push and pop****");\
[nav popToViewController:ViewController animated:animated];



#define SDCRoutePresentToVC(ViewController,animated)\
UINavigationController *nv=[[UINavigationController alloc]initWithRootViewController:ViewController];\
[[UIApplication sharedApplication].currentViewController presentViewController:nv animated:animated completion:nil];


#define SDCRouteDismissToVC(animated)\
UINavigationController *nav = [UIApplication sharedApplication].currentViewController.navigationController;\
if(nav == nil){[[UIApplication sharedApplication].currentViewController dismissViewControllerAnimated:animated completion:nil];}else{[[UIApplication sharedApplication].currentViewController.navigationController dismissViewControllerAnimated:animated completion:nil];}\







//配置 跳转的scheme
#define LocalRouteUrlPrefix  @"campuslocal://"    /**< app内页面跳转的url */
#define ThirdRouteUrlPrefix   @"CampusApp://"   /**< 第三方的跳转到app内 */

//配置跳转的key
#define RouteToTestVC               @"toTestVC" /**<进入测试页面 */
#define RouteToTestWeb              @"toTestWeb"    /**< 进入测试的网页 */




#endif /* SDCUrlRouteConfig_h */
