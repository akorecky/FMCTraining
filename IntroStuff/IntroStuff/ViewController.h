//
//  ViewController.h
//  IntroStuff
//
//  Created by FMCAdmin on 3/3/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
- (IBAction)changeScreenColor:(id)sender;
- (IBAction)changeHeader:(id)sender;

@end
