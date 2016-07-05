//
//  SDCUrlRouteCenter.h
//  newCampus
//
//  Created by YYDD on 16/3/10.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCUrlRouteConfig.h"


NSString* localRouteUrl(NSString *routekey);

@interface SDCUrlRouteCenter : NSObject

+(SDCUrlRouteCenter *)sharedCenter;

/**
 *  url跳转   默认是push 操作
 *
 *  @param urlkey   跳转路径（可以是网址、也可以是协议）
 *  @param animated 是否需要动画
 */
- (void)open:(NSString *)urlkey
    animated:(BOOL)animated;

/**
 *  url跳转   默认是push操作
 *
 *  @param urlkey      跳转路径（可以是网址、也可以是协议）
 *  @param animated    是否需要动画
 *  @param extraParams 额外的参数
 */
- (void)open:(NSString *)urlkey
    animated:(BOOL)animated
 extraParams:(NSDictionary *)extraParams;

/**
 *  url跳转
 *
 *  @param urlkey      跳转路径（可以是网址、也可以是协议）
 *  @param animated    是否需要动画
 *  @param type        跳转动作
 *  @param extraParams 额外的参数
 */
- (void)open:(NSString *)urlkey
    animated:(BOOL)animated
    URLRedirectType:(UrlRedirectType)type
 extraParams:(NSDictionary *)extraParams;

/**
 *  url跳转
 *
 *  @param urlkey   跳转路径（可以是网址、也可以是协议）
 *  @param animated 是否需要动画
 *  @param type     跳转动作
 */
- (void)open:(NSString *)urlkey
    animated:(BOOL)animated
    URLRedirectType:(UrlRedirectType)type;



/**
 *  返回 默认返回上一页 pop
 *
 *  @param animated 是否需要动画
 */
- (void)closeWithAnimated:(BOOL)animated;

/**
 *  返货 默认返回pop
 *
 *  @param urlkey   返回路径（可以是网址、也可以是协议）
 *  @param animated 是否需要动画
 */
- (void)close:(NSString *)urlkey
     animated:(BOOL)animated;





-(void)goToVC:(UIViewController *)vc animated:(BOOL)animated URLRedirectType:(UrlRedirectType)type;

-(void)goToWeb:(NSString *)urlStr animated:(BOOL)animated URLRedirectType:(UrlRedirectType)type;




/**
 *  进入一个统一的 错误页面
 */
-(void)goToErrorVC;



@end
