//
//  ViewController.m
//  PushParameterWithDict
//
//  Created by lujh on 2018/2/8.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "ViewController.h"
#import "ModalManager.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"控制器耦合优化";
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width -300)/2.0, 200, 300, 50)];
    [button setTitle:@"项目中能找到的VC带参数跳转" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.tag = 1;
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width -300)/2.0,300 , 300, 50)];
    [button2 setTitle:@"项目中不能找到的VC" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.tag = 2;
    [button2 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width -300)/2.0, 400, 300, 50)];
    [button3 setTitle:@"项目中能找到的VC不带参数跳转" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button3.tag = 3;
    [button3 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
}

-(void)back:(UIButton *)btn
{
    switch (btn.tag) {
        case 1:{
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:@"hello world" forKey:@"title"];
            UIViewController *controller = [[ModalManager sharedInstance] getViewController:@"FirstViewController" withParam:dic];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 2:{
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:@"hello world" forKey:@"title"];
            UIViewController *controller = [[ModalManager sharedInstance] getViewController:@"项目中不能找到的VC"  withParam:dic];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 3:{
        
            UIViewController *controller = [[ModalManager sharedInstance] getViewController:@"FirstViewController" withParam:nil];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
