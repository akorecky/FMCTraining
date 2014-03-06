//
//  CodeAutoLayoutViewController.m
//  AutoLayout
//
//  Created by FMCAdmin on 3/6/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "CodeAutoLayoutViewController.h"

@interface CodeAutoLayoutViewController ()
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation CodeAutoLayoutViewController
int i;
@synthesize imageView;
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
    self.preferredInterfaceOrientationForPresentation;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    NSLog(@"didRotateFromInterfaceOrientation");
    if (fromInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        self.view.backgroundColor = [UIColor blueColor];
    } else if (fromInterfaceOrientation == UIInterfaceOrientationPortrait) {
        self.view.backgroundColor = [UIColor blackColor];
    } else if (fromInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        self.view.backgroundColor = [UIColor orangeColor];
    } else {
        self.view.backgroundColor = [UIColor greenColor];
    }
}

//autolayout conflicts with with programatic with frame coordinates like CGRect
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    NSLog(@"willRotateToInterfaceOrientation");
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight || toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        imageView.image =[UIImage imageNamed:@"sochi.jpeg"];
        imageView.frame = CGRectMake(0, 0, 568, 320);
    } else {
        imageView.image = [UIImage imageNamed:@"water.jpeg"];
        imageView.frame = CGRectMake(0, 0, 568, 320);
    }
}
-(BOOL)shouldAutorotate {
    NSLog(@"CodeAutoLayoutViewController:shouldAutorotate[%i]", i);
    return YES;
}

-(NSUInteger) supportedInterfaceOrientations {
    //return (UIInterfaceOrientationMaskPortraitUpsideDown | UIInterfaceOrientationMaskLandscapeRight);
    i++;
    NSLog(@"CodeAutoLayoutViewController:supportedInterfaceOrientations[%i]", i);
    return (UIInterfaceOrientationMaskAll);
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    NSLog(@"CodeAutoLayoutViewController[preferredInterfaceOrientationForPresentation]");
    return UIInterfaceOrientationLandscapeLeft;
}

@end
