//
//  ViewController.m
//  wkWebView
//
//  Created by gouzi on 2017/1/6.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

// 这是V2

@interface ViewController ()<WKNavigationDelegate, UIGestureRecognizerDelegate,WKUIDelegate, UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self webViewInit];
    
    self.navigationController.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

// 状态栏设置
- (void)statusBarSettings {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    view.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:170 / 255.0 blue:251 / 255.0 alpha:1.0];
    [self.view addSubview:view];
}


- (void)webViewInit {
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    webView.navigationDelegate = self;
//    webView.UIDelegate = self;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    [self.view addSubview:webView];
    webView.scrollView.scrollEnabled = NO;
}
#pragma mark - 导航栏的代理
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isPushSelfClass = [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isPushSelfClass animated:animated];
}

#pragma mark - 加载状态的回调
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"页面开始加载");
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"数据开始返回");
    // 设置状态栏的颜色
    [self statusBarSettings];

}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"页面已经加载完成");
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation {
    
    NSLog(@"页面加载失败");
}


#pragma mark - 页面跳转的代理
// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"navigation is %@", navigation);
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.sina.com"]]];
}
// 在收到响应后，决定是否跳转
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
//    
//}
//// 在发送请求之前，决定是否跳转
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    
//}

@end
