//
//  LoginViewController.h
//  
//
//  Created by FMCAdmin on 3/5/14.
//
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *uName;
- (IBAction)login:(id)sender;

@end
