//
//  WebViewViewController.m
//  WebView
//
//  Created by FMCAdmin on 3/3/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()

@end

@implementation WebViewViewController
@synthesize webView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSURL *theURL = [NSURL URLWithString:@"http://www.google.com"];
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:theURL];
    
    [webView loadRequest:theRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
