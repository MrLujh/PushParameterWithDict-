
//
//  WebViewController.m
//  PushParameterWithDict
//
//  Created by lujh on 2018/2/8.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"错误页";
    
    UIWebView * view = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [view loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.view addSubview:view];
}

-(void)initViewControllerWithParameter:(NSDictionary *)dic{
    
    self.url = dic[@"errorUrl"];
}

@end
