//
//  UIViewController+SDCUrlRoute.h
//  UrlRouteSample
//
//  Created by YYDD on 16/7/4.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import <UIKit/UIKit.h>

//customMsg 用户做一些判断 或者返回的标记 页面间自定义
typedef void (^DataReCallBlock)(id customValue);

@interface UIViewController (SDCUrlRoute)

/**
 *  创建vc
 *
 *  @param params 传过去的参数
 *
 *  @return 返回初始化vc
 */
+(instancetype)createdRouteVCWithParams:(NSDictionary *)params;


@property(nonatomic,copy)DataReCallBlock routeReCallBlock;


@end
