
//
//  FirstViewController.m
//  PushParameterWithDict
//
//  Created by lujh on 2018/2/8.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)initViewControllerWithParameter:(NSDictionary *)dic
{
    self.title = [dic objectForKey:@"title"];
}

@end
