//
//  wjVC.m
//  wkWebView
//
//  Created by gouzi on 2017/1/22.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjVC.h"
#import "ViewController.h"
#import "wjTestViewController.h"

// 这是V1

@interface wjVC ()

@end

@implementation wjVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navigationBarSettings];
    [self nextView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}


- (void)navigationBarSettings {
    self.title = @"123";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],
                                                                      NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255 / 255.0 green:170  / 255.0 blue:251  / 255.0 alpha:1.0]];
    // 这里定义一些按钮的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}


- (void)nextView {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点击进入隐藏导航栏" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(50, 250, 250, 30);
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"点击进入没有隐藏导航栏" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn1.frame = CGRectMake(50, 350, 250, 30);
    [self.view addSubview:btn1];
    
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 addTarget:self action:@selector(click1:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click:(UIButton *)btn {
    ViewController *vc = [[ViewController alloc] init];

    [self.navigationController pushViewController:vc animated:YES];
}

- (void)click1:(UIButton *)btn {
    wjTestViewController *vc1 = [[wjTestViewController alloc] init];
    
    [self.navigationController pushViewController:vc1 animated:YES];
}
@end
