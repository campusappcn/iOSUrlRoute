//
//  SDCUrlRouteCenter_Protect.h
//  UrlRouteSample
//
//  Created by YYDD on 16/8/3.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import "SDCUrlRouteCenter.h"

@interface SDCUrlRouteCenter ()



-(void)goToVC:(UIViewController *)vc animated:(BOOL)animated URLRedirectType:(UrlRedirectType)type;

-(void)goToWeb:(NSString *)urlStr animated:(BOOL)animated URLRedirectType:(UrlRedirectType)type;



@end
