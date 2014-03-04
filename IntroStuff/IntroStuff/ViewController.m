//
//  ViewController.m
//  IntroStuff
//
//  Created by FMCAdmin on 3/3/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize headerLabel;
@synthesize bottomLabel;
@synthesize mySlider;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    headerLabel.text = @"Too Many Questions!";
    headerLabel.font = [UIFont fontWithName:@"Courier" size:17];
    headerLabel.textColor = [UIColor brownColor];
 //   headerLabel.sizeToFit;
    
    bottomLabel.text = @"This is the end!!!";
    
    mySlider.maximumTrackTintColor = [UIColor orangeColor];
    mySlider.minimumTrackTintColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeHeader:(id)sender {
    headerLabel.text = @"Chicago Theater";
}

- (IBAction)changeScreenColor:(id)sender {
    self.view.backgroundColor = [UIColor purpleColor];
    
}
@end
