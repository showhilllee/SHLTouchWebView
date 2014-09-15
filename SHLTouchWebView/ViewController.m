//
//  ViewController.m
//  SHLTouchWebView
//
//  Created by 开发机 on 9/12/14.
//  Copyright (c) 2014 showhilllee. All rights reserved.
//

#import "ViewController.h"
#import "SHLWebView.h"

@interface ViewController () <UIWebViewDelegate, UIGestureRecognizerDelegate> {
    SHLWebView* shlWebView;
}

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSString* path = [[NSString alloc] init];
    path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"chapter01.html"] ofType:nil];
    
    shlWebView = [[SHLWebView alloc] initWithFrame:self.view.bounds];
    [shlWebView loadRequestWithURL:path];
    [self.view addSubview:shlWebView];
    
    // 设置字体大小
    shlWebView.frontSize = 25;
    
    // 设置背景色(默认两种，YES时显示白色背景，NO时显示灰色背景)
    shlWebView.isDay = YES;
    
    // 设置背景颜色
    shlWebView.color = [UIColor cyanColor];
    
    // 1.通过WebView的代理实现
    shlWebView.delegate = self;
    
    // 2.通过给webView添加手势实现
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    singleTap.delegate= self;
    singleTap.cancelsTouchesInView = NO;
    [shlWebView addGestureRecognizer:singleTap];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //刷新字体大小
    [shlWebView refreshFrontSize];
}

- (void)webView:(UIWebView*)sender zoomingEndedWithTouches:(NSSet*)touches event:(UIEvent*)event
{
    NSLog(@"finished zooming");
}

- (void)webView:(UIWebView*)sender tappedWithTouch:(UITouch*)touch event:(UIEvent*)event
{
    NSLog(@"tapped");
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

-(void)handleSingleTap:(UITapGestureRecognizer *)sender{
    CGPoint point = [sender locationInView:self.view];
    NSLog(@"handleSingleTap!pointx:%f,y:%f",point.x,point.y);
}

#pragma mark - end
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    shlWebView = nil;
}

@end
