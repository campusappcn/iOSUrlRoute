//
//  SDCUrlRouteCenter+VC.h
//  LaoBaiStore
//
//  Created by YYDD on 2016/12/29.
//  Copyright © 2016年 zyh. All rights reserved.
//

#import "SDCUrlRouteCenter.h"

@interface SDCUrlRouteCenter (VC)


/**
 查找urlkey对应的class

 @param urlKey urlkey
 @return class
 */
-(Class)findClass:(NSString *)urlKey;



/**
 创建主tab页面

 @param urlKey urlKey
 @return vc
 */
-(UIViewController *)createViewControllerInMainTab:(NSString *)urlKey;


/**
 创建normal页面
 
 @param urlKey urlKey
 @return vc
 */
-(UIViewController *)createViewController:(NSString *)urlKey;



@end
