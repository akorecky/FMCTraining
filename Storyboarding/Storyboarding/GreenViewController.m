//
//  GreenViewController.m
//  Storyboarding
//
//  Created by FMCAdmin on 3/5/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "GreenViewController.h"

@interface GreenViewController ()

@end

@implementation GreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"Green Screen" message:@"You are on the green screen." delegate:self cancelButtonTitle:@"Wonderous" otherButtonTitles:nil, nil];
    
    [view show];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
