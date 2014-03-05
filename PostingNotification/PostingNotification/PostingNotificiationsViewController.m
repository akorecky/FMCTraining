//
//  PostingNotificiationsViewController.m
//  PostingNotification
//
//  Created by FMCAdmin on 3/5/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "PostingNotificiationsViewController.h"

@interface PostingNotificiationsViewController ()

@end

@implementation PostingNotificiationsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(processNotification:) name:@"AlertBoxWasClicked" object:nil];
    
    customDelegate = [[CustomAVDelegate alloc] init];
    
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"Hello World" message:@"I am here." delegate:customDelegate cancelButtonTitle:@"Push Me!" otherButtonTitles:@"Don't Push Me!", nil];
    
    [view show];
}

-(void) processNotification:(NSNotification *) notification {
    NSLog(@"NOTIFICATION ARRIVED!!! You Have Mail.");
    NSDictionary *tmpDict = [notification userInfo];
    
    NSLog(@"dictionary = %@", tmpDict);
    
    int buttonNum = [[tmpDict objectForKey:@"ButtonUserClickedOn"] integerValue];
    
    switch (buttonNum) {
        case 0:
            self.view.backgroundColor = [UIColor blueColor];
            break;
        case 1:
            self.view.backgroundColor = [UIColor orangeColor];
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
