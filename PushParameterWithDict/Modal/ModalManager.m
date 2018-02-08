//
//  ModalManager.m
//  PushParameterWithDict
//
//  Created by lujh on 2018/2/8.
//  Copyright © 2018年 lujh. All rights reserved.
//
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#import "ModalManager.h"
#import "ModalError.h"

@interface ModalManager()
/**路由信息数据字典*/
@property(nonatomic,strong) NSMutableDictionary *plistdata;
@end

@implementation ModalManager
+(id)sharedInstance{
    static dispatch_once_t onceToken;
    static ModalManager * router;
    dispatch_once(&onceToken,^{
        router = [[ModalManager alloc] init];
    });
    return router;
}

-(UIViewController *)getViewController:(NSString *)stringVCName withParam:(NSDictionary *)paramdic
{
    Class class = NSClassFromString(stringVCName);
    UIViewController *controller = [[class alloc] init];
    if(controller != nil){
        controller = [self controller:controller withParam:paramdic andVCname:stringVCName];
    }else{
        NSLog(@"未找到此类:%@",stringVCName);
        //EXCEPTION  Push a Normal Error VC
        controller = [[ModalError sharedInstance] getErrorController];
    }
    return controller;
}

/**
 此方法用来初始化参数（控制器初始化方法默认为 initViewControllerParam）
 @param controller 获取到的实例VC
 @param paramdic 实例化参数
 @param vcName 控制器名字
 @return 初始化之后的VC
 */
-(UIViewController *)controller:(UIViewController *)controller withParam:(NSDictionary *)paramdic andVCname:(NSString *)vcName {
    
    SEL selector = NSSelectorFromString(@"initViewControllerWithParameter:");
    if(![controller respondsToSelector:selector]){  //如果没定义初始化参数方法，直接返回，没必要在往下做设置参数的方法
        NSLog(@"目标类:%@未定义:%@方法",controller,@"initViewControllerWithParameter:");
        return controller;
    }

    SuppressPerformSelectorLeakWarning( [controller performSelector:selector withObject:paramdic]);
    return controller;
}

@end
