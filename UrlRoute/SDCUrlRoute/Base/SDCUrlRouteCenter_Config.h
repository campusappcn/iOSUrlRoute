//
//  SDCUrlRouteCenter_Config.h
//  UrlRouteSample
//
//  Created by YYDD on 2017/8/21.
//  Copyright © 2017年 com.shudong.urlRoute. All rights reserved.
//

#import "SDCUrlRouteCenter.h"

@interface SDCUrlRouteCenter ()

/**
 配置routePlist 文件路径

 @param filePath 文件路径
 */
+(void)addRoutePlistFilePath:(nullable NSString *)filePath;


/**
 app内跳转

 @param schemeKey defalut: sdcLocal://
 */
+(void)addLocalRouteUrlScheme:(nullable NSString *)schemeKey;


/**
 app外跳转进app内特定页面

 @param schemeKey default: sdcApp://
 */
+(void)addThirdRouteUrlScheme:(nullable NSString *)schemeKey;



@end
