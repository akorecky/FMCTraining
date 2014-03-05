//
//  KeyboardScrollViewController.m
//  KeyboardScroll
//
//  Created by FMCAdmin on 3/4/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "KeyboardScrollViewController.h"

@interface KeyboardScrollViewController () 
@end

@implementation KeyboardScrollViewController
@synthesize scrollView;

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    scrollView.frame = CGRectMake(0, 0, 320, 568);
    scrollView.contentSize = CGSizeMake(320,1200);
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [super viewWillAppear:animated];
}

-(void) textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldDidBeginEditing");
    currentTextField = textField;
}
-(BOOL) textFieldShouldReturn: (UITextField *) textFieldView {
    NSLog(@"textFieldShouldReturn");
    [textFieldView resignFirstResponder];
    return NO;
}



-(void) textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"textFieldDidEndEditing");
    currentTextField = nil;
}

-(void) keyboardDidShow: (NSNotification *) notification {
    NSLog(@"keyboardDidShow");
    if (keyboardIsShown) return;
    NSDictionary* info = [notification userInfo];
    NSValue *aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [self.view convertRect:[aValue CGRectValue] fromView:nil];
    
    NSLog(@"%f", keyboardRect.size.height);
    
    CGRect viewFrame = [scrollView frame];
    viewFrame.size.height -= keyboardRect.size.height;
    scrollView.frame = viewFrame;
    
    CGRect textFieldRect = [currentTextField frame];
    
    [scrollView scrollRectToVisible:textFieldRect animated:YES];
    
    keyboardIsShown = YES;
}

-(void) keyboardDidHide:(NSNotification *) notification {
    NSLog(@"keyboardDidHide");
    NSDictionary *info = [notification userInfo];
    
    NSValue *aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [self.view convertRect:[aValue CGRectValue] fromView:nil];
    
    CGRect viewFrame = [scrollView frame];
    
    viewFrame.size.height += keyboardRect.size.height;
    
    scrollView.frame = viewFrame;
    
    CGRect textFieldRect = [currentTextField frame];
    [scrollView scrollRectToVisible:textFieldRect animated:YES];
    
    keyboardIsShown = NO;
}

-(void) viewWillDisappear:(BOOL)animated{
    NSLog(@"viewWillDisappear");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    [super viewWillDisappear:animated];
}

- (IBAction)closeKeyboard:(id)sender {
    NSLog(@"closeKeyboard");
    [currentTextField resignFirstResponder];
}
@end
