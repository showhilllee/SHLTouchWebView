//
//  SHLWebView.h
//  SHLTouchWebView
//
//  Created by 开发机 on 9/12/14.
//  Copyright (c) 2014 showhilllee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHLWebView : UIWebView 

@property (nonatomic) float frontSize;
@property (nonatomic, setter=setColor:) UIColor* color;
@property (nonatomic, setter=setDayOrNight:) BOOL isDay;

- (void) loadRequestWithURL:(NSString*)url;
- (void) refreshFrontSize;

@end
