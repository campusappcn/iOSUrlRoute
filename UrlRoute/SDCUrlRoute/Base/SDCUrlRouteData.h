//
//  SDCUrlRouteData.h
//  newCampus
//
//  Created by YYDD on 16/3/10.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDCUrlRouteData : NSObject

+(SDCUrlRouteData *)sharedData;

/**
 *  判断当前的string是否是有效的网址
 *
 *  @param urlKey string
 *
 *  @return boolean是否是网址
 */
-(BOOL)isWebUrl:(NSString *)urlKey;


/**
 *  在urlKey中找到参数
 *
 *  @param urlKey string
 *
 *  @return 返回参数的dict
 */
-(NSDictionary *)findParamsContainInUrlKey:(NSString *)urlKey;

/**
 *  在urlkey中找到对应的uivewcontroller 并将其初始化
 *
 *  @param key         urlKey
 *  @param extraParams 传递的参数
 *
 *  @return 返回 已经初始化的uiviewcontroller
 */
-(UIViewController *)findVCWithUrlKey:(NSString *)key extraParams:(NSDictionary *)extraParams;

/**
 *  在urlkey中找到对应的url网址
 *
 *  @param key         urlkey
 *  @param extraParams 传递参数
 *
 *  @return 返回 url网址
 */
-(NSString *)findUrlWithUrlKey:(NSString *)key extraParams:(NSDictionary *)extraParams;


-(BOOL)checkUrlPathValid:(NSString *)urlStr;

-(Class)classFromUrlKey:(NSString *)urlkey;

@end
