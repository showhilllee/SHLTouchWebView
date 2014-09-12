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
    SHLWebView* webView;
}

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    webView = [[SHLWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com/"]]];
    [self.view addSubview:webView];
    
    // 1.通过WebView的代理实现
    webView.delegate = self;
    
    // 2.通过给webView添加手势实现
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    singleTap.delegate= self;
    singleTap.cancelsTouchesInView = NO;
    [webView addGestureRecognizer:singleTap];
}

#pragma mark - UIWebViewDelegate
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

@end
