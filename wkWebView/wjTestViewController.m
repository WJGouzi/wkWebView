//
//  wjTestViewController.m
//  wkWebView
//
//  Created by gouzi on 2017/2/7.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjTestViewController.h"

// 这是V3

@interface wjTestViewController ()<UIGestureRecognizerDelegate>

@end

@implementation wjTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}



@end
