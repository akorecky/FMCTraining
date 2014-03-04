//
//  LoginViewController.h
//  Login
//
//  Created by FMCAdmin on 3/3/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userPasswordTextField;
- (IBAction)checkPassword:(id)sender;

@end
