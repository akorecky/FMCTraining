//
//  LoginViewController.m
//  
//
//  Created by FMCAdmin on 3/5/14.
//
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"Logged In" message:@"You have been logged in." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [view show];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
}
@end
