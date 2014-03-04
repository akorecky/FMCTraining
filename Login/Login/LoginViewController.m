//
//  LoginViewController.m
//  Login
//
//  Created by FMCAdmin on 3/3/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@end

@implementation LoginViewController
@synthesize userPasswordTextField;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    userPasswordTextField.placeholder = @"Password";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkPassword:(id)sender {
    NSLog(@"User Password: %@", userPasswordTextField.text);
    if([userPasswordTextField.text isEqualToString:@"secret"]) {
        NSLog(@"User password correct!");
        self.view.backgroundColor = [UIColor brownColor];
    } else {
        NSLog(@"User password incorrect!");
//        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                             message:@"Invalid Password! Try agin!"
//                                                            delegate:self
//                                                   cancelButtonTitle:@"No"
//                                                   otherButtonTitles:@"Yes", nil];
//        errorAlert.id = @"login.error";
//        [errorAlert show];
        UIActionSheet *userChoices = [[UIActionSheet alloc] initWithTitle:@"Error!"
                                                                 delegate:self
                                                        cancelButtonTitle:@"Ok"
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:@"Maybe", @"Ask Me Later", @"Remind Me ", nil];
        [userChoices showInView:self.view];
        userChoices.tag = 1;
        resignFirstResponder];
    userPasswordTextField.text = @"";
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"buttonIndex = %i, alertTitle = %@", buttonIndex, actionSheet.title);
    if(buttonIndex == 1 ) {
        userPasswordTextField.text = @"";
    } else {
        userPasswordTextField.hidden = TRUE;
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"buttonIndex = %i, alertTitle = %@", buttonIndex, alertView.title);
    if(buttonIndex == 1 ) {
        userPasswordTextField.text = @"";
    } else {
        userPasswordTextField.hidden = TRUE;
    }
}
@end
