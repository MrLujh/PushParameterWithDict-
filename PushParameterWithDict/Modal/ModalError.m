//
//  ModalError.m
//  PushParameterWithDict
//
//  Created by lujh on 2018/2/8.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "ModalError.h"
#import "ModalManager.h"

@implementation ModalError

+(id)sharedInstance
{
    static dispatch_once_t onceToken;
    static ModalError * routerError;
    dispatch_once(&onceToken,^{
        routerError = [[ModalError alloc] init];
    });
    return routerError;
}

#pragma mark  自定义错误页面 此页面一定确保能够找到，否则会进入死循环
-(UIViewController *)getErrorController{
    NSDictionary *diction = [[NSMutableDictionary alloc] init];
    [diction setValue:@"https://github.com/daniulaolu" forKey:@"errorUrl"];
    UIViewController *errorController = [[ModalManager sharedInstance] getViewController:@"WebViewController" withParam:diction];
    return errorController;
}

@end
