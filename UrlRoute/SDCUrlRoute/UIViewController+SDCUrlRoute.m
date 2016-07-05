//
//  UIViewController+SDCUrlRoute.m
//  UrlRouteSample
//
//  Created by YYDD on 16/7/4.
//  Copyright © 2016年 com.shudong.urlRoute. All rights reserved.
//

#import "UIViewController+SDCUrlRoute.h"
#import "UIApplication+SDCUrlRoute.h"
#import <objc/runtime.h>

static char routeReCallBlockKey;

@implementation UIViewController (SDCUrlRoute)

@dynamic routeReCallBlock;


+(instancetype)createdRouteVCWithParams:(NSDictionary *)params
{
    return nil;
}



+(void)load
{
    //swizzle方法调换
    [UIViewController swizzleViewWillAppear];
}

+(void)swizzleViewWillAppear
{
    SEL originalSelector = @selector(viewWillAppear:);
    SEL swizzleSelector = @selector(trick_viewWillAppear:);
    
    Method originalMethod = class_getInstanceMethod([self class], originalSelector);
    Method swizzleMethod = class_getInstanceMethod([self class], swizzleSelector);
    
    method_exchangeImplementations(originalMethod, swizzleMethod);
}

-(void)trick_viewWillAppear:(BOOL)animated
{

    [self trick_viewWillAppear:animated];

    NSBundle *mainB = [NSBundle bundleForClass:[self class]];
    if (mainB == [NSBundle mainBundle]) {
        [UIApplication sharedApplication].currentViewController = self;
    }
}





#pragma mark routeReCallBlock set&get

-(void)setRouteReCallBlock:(DataReCallBlock)routeReCallBlock
{
    objc_setAssociatedObject(self, &routeReCallBlockKey, routeReCallBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


-(DataReCallBlock)routeReCallBlock
{
    return objc_getAssociatedObject(self, &routeReCallBlockKey);
}





@end
