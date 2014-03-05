//
//  KeyboardScrollViewController.h
//  KeyboardScroll
//
//  Created by FMCAdmin on 3/4/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardScrollViewController : UIViewController <UITextFieldDelegate> {
    UITextField *currentTextField;
    BOOL keyboardIsShown;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)closeKeyboard:(id)sender;

@end
