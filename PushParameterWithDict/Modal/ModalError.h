//
//  ModalError.h
//  PushParameterWithDict
//
//  Created by lujh on 2018/2/8.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ModalError : NSObject
+(id)sharedInstance;
-(UIViewController *)getErrorController;
@end
