//
//  SDCUrlRouteData.m
//  newCampus
//
//  Created by YYDD on 16/3/10.
//  Copyright © 2016年 com.campus.cn. All rights reserved.
//

#import "SDCUrlRouteData.h"
#import "UIViewController+SDCUrlRoute.h"
#import "SDCUrlRouteConfig.h"

@interface SDCUrlRouteData()

@property(nonatomic,strong)NSDictionary *urlRouteData;

@end

@implementation SDCUrlRouteData

+(SDCUrlRouteData *)sharedData
{
    static SDCUrlRouteData *urlRouteData = nil;
    
    if (urlRouteData == nil) {
        urlRouteData = [[self alloc]init];
    }
    return urlRouteData;
}


-(instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}


//找到参数
-(NSDictionary *)findParamsContainInUrlKey:(NSString *)urlKey
{
    
    NSRange range = [urlKey rangeOfString:@"?"];
    if (range.length != 0) {
        NSString *paramsStr = [urlKey substringFromIndex:(range.location + range.length)];
        NSArray *paramsArr = [paramsStr componentsSeparatedByString:@"&"];
        
        NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];
        for (NSString *str in paramsArr) {
            NSArray *arr = [str componentsSeparatedByString:@"="];
            if (arr.count == 2) {
                NSString *key = [arr firstObject];
                id value = [arr lastObject];
                [mutDict setObject:value forKey:key];
            }else
            {
                continue;
            }
        }
        
        return [mutDict copy];
    }
    
    return nil;
    
}

//判断是否是网址
-(BOOL)isWebUrl:(NSString *)urlKey
{
    if (!urlKey) {
        return NO;
    }
    //先这样简单的判断 还有ftp:// 什么的
    if ([self checkUrlPathValid:urlKey]) {
        return YES;
    }
    
    
    //如果urlkey 本身不是一个网址 那么相对于的类 是不是一个连接地址
    NSString *className = [self classNameWithKey:urlKey];
    if ([self checkUrlPathValid:className]) {
        return YES;
    }
    
    return NO;
}



-(UIViewController *)findVCWithUrlKey:(NSString *)key extraParams:(NSDictionary *)extraParams
{
    //解析url 获取需要跳转的类名
    if (!key) {
        return nil;
    }
    
    Class class = [[SDCUrlRouteData sharedData]classFromUrlKey:key];
    UIViewController *vc = nil;
    
#pragma clang diagnostic ignored "-Warc-createdRouteVCWithParams:-leaks"
    if ([class respondsToSelector:@selector(createdRouteVCWithParams:)]) {
        vc = [class createdRouteVCWithParams:extraParams];
    }
    
    return vc;
}


-(NSString *)findUrlWithUrlKey:(NSString *)key extraParams:(NSDictionary *)extraParams
{
    NSString *urlStr = nil;
    if ([self checkUrlPathValid:key]) {
        urlStr = key;
    }
    
    NSString *className = [self classNameWithKey:key];
    if ([self checkUrlPathValid:className]) {
        urlStr = className;
    }
    
    for (int i = 0; i < extraParams.allKeys.count ; i ++) {
        if (i == 0) {
            [urlStr stringByAppendingString:@"?"];
        }else
        {
            [urlStr stringByAppendingString:@"&"];
        }
        
        NSString *str = [NSString stringWithFormat:@"%@=%@",key,extraParams[key]];
        [urlStr stringByAppendingString:str];
    }
    
    return urlStr;
}



#pragma mark -- private Method


//读取对应的列表
-(NSDictionary *)urlRouteData
{
    if (!_urlRouteData) {
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"SDCUrlRouteFile" ofType:@"plist" inDirectory:nil];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
        _urlRouteData = dict;
    }
    return _urlRouteData;
}


//根据类的字符串名字 返回类
-(Class)classFromClassName:(NSString *)name
{
    Class class = nil;
    if (name) {
        class = NSClassFromString(name);
    }else
    {
        class = nil;
    }
    return class;
}



//根据urlkey 找出class
-(Class)classFromUrlKey:(NSString *)urlkey
{
    if (urlkey) {
        NSString *className = [self classNameWithKey:urlkey];
        return [self classFromClassName:className];
    }else
    {
        return nil;
    }
    
}

//根据key找到类名
-(NSString *)classNameWithKey:(NSString *)key
{
    if (!key) {
        return nil;
    }
    
    NSString *classNameKey = nil;
    NSString *str = nil;
    if ([key hasPrefix:LocalRouteUrlPrefix]) {
        str = [key substringFromIndex:LocalRouteUrlPrefix.length];
    }else if ([key hasPrefix:ThirdRouteUrlPrefix])
    {
        str = [key substringFromIndex:ThirdRouteUrlPrefix.length];
    }
    
    if ([str rangeOfString:@"?"].length != 0) {
        NSArray *strArr = [str componentsSeparatedByString:@"?"];
        classNameKey = [strArr firstObject];
    }else if ([str rangeOfString:@"/"].length != 0){
        
        NSArray *strArr = [str componentsSeparatedByString:@"/"];
        classNameKey = [strArr firstObject];
    }else{
        
        classNameKey = str;
    }
    
    return self.urlRouteData[classNameKey];
}


-(BOOL)checkUrlPathValid:(NSString *)urlStr
{
    if (urlStr) {

        NSString *regx = @"(http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&amp;*+?:_/=<>]*)?";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regx];
        return [predicate evaluateWithObject:urlStr];
        
    }
    return NO;
}

@end
