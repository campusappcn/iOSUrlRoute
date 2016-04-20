//
//  CurrentViewController.h
//  campus
//
//  Created by Kael on 8/27/15.
//  Copyright (c) 2015 com.treeholeapp.campus. All rights reserved.
//

#import <UIKit/UIKit.h>

//customMsg 用户做一些判断 或者返回的标记 页面间自定义
typedef void (^DataReloadBlock)(id customValue);

@interface CurrentViewController : UIViewController


/**
 *  创建vc
 *
 *  @param params 传过去的参数
 *
 *  @return 返回初始化vc
 */
+(instancetype)createdRouteVCWithParams:(NSDictionary *)params;


@property(nonatomic,copy)DataReloadBlock routeReloadBlock;



@end
