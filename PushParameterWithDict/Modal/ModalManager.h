//
//  ModalManager.h
//  PushParameterWithDict
//
//  Created by lujh on 2018/2/8.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ModalManager : NSObject
+(id)sharedInstance;
/**
 返回一个初始化参数之后的控制器
 @param stringVCName 控制器名字
 @param paramdic 初始化参数 字典格式
 @return 控制器实例
 */
-(UIViewController *)getViewController:(NSString *)stringVCName withParam:(NSDictionary *)paramdic;
@end
