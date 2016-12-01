//
//  SDCUrlRouteMapping.m
//  UrlRouteSample
//
//  Created by YYDD on 2016/12/1.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import "SDCUrlRouteMapping.h"

@interface SDCUrlRouteMapping()

@property(nonatomic,strong)NSDictionary *mappingData;

@end

@implementation SDCUrlRouteMapping

-(NSDictionary *)mappingData {

    
    //这里可以更新动态更新map
    if (!_mappingData) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"SDCUrlRouteFile" ofType:@"plist" inDirectory:nil];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
        _mappingData = dict;
    }
    return _mappingData;

}

@end
