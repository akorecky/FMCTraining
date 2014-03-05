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
@synthesize webView, urlTextF;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSURL *theURL = [NSURL URLWithString:@"http://www.cnn.com"];
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:theURL];
    [webView loadRequest:theRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadPage:(id)sender {
    NSLog(@"Got Here: %@", urlTextF.text);
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:
                                                       [NSString stringWithFormat:@"http://%@", urlTextF.text]]]];
    [urlTextF resignFirstResponder];
}
@end
