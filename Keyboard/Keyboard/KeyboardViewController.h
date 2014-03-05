//
//  KeyboardViewController.h
//  Keyboard
//
//  Created by FMCAdmin on 3/4/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardViewController : UIViewController <UITextFieldDelegate>


//upon hit of return button
-(IBAction)hideKeyboard:(id)sender;


- (IBAction)determineTextField:(id)sender;

- (IBAction)dismissKeyboard:(id)sender;

@end
