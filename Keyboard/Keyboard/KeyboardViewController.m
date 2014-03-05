//
//  KeyboardViewController.m
//  Keyboard
//
//  Created by FMCAdmin on 3/4/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()
@property UITextField *activeTF;
@end

@implementation KeyboardViewController
@synthesize activeTF;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

// on click of return button
-(void) hideKeyboard:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)determineTextField:(id)sender {
    
}

// click of invisible button
- (IBAction)dismissKeyboard:(id)sender {
    NSLog(@"dismissKeyboard: %@", activeTF);
    [activeTF resignFirstResponder];
    
}


//dtermines lastest selected text field (Controller must be delegate)
- (void) textFieldDidBeginEditing:(UITextField *)textField {
    activeTF = textField;
    NSLog(@"text field: %@", activeTF.text);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
