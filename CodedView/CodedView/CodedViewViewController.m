//
//  CodedViewViewController.m
//  CodedView
//
//  Created by FMCAdmin on 3/4/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "CodedViewViewController.h"

@interface CodedViewViewController ()

@end

@implementation CodedViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    view.backgroundColor = [UIColor lightGrayColor];
    
    CGRect frame = CGRectMake(10, 15, 300, 20);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Veranda" size:20];
    label.text = @"This is a label";
    label.tag = 1000;
    
    frame = CGRectMake(10, 70, 300, 50);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:@"Click ME, Please!" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.tag = 2000;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:label];
    [view addSubview:button];
    self.view = view;
}

-(IBAction) buttonClicked:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Action Invoked!" message:@"Button Clicked!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
