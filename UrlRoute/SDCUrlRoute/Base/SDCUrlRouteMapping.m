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
        
        if (_mappingFilePath) {
            NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:_mappingFilePath];
            _mappingData = dict;
        }
    }
    return _mappingData;

}

-(void)setMappingFilePath:(NSString *)mappingFilePath {

    if (mappingFilePath) {
        _mappingFilePath = mappingFilePath;
        _mappingData = nil;
    }
}


@end
