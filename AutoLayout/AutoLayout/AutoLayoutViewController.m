//
//  AutoLayoutViewController.m
//  AutoLayout
//
//  Created by FMCAdmin on 3/6/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "AutoLayoutViewController.h"

@interface AutoLayoutViewController ()

@end

@implementation AutoLayoutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.addButton = [self addButtonWithTitle:@"Add" action:@selector(addImageView)];
    self.removeButton = [self addButtonWithTitle:@"Remove" action:@selector(removeImageView)];
    self.clearButton = [self addButtonWithTitle:@"Clear" action:@selector(clearImageView)];
}

- (void) addImageView {
    
}
- (void) removeImageView {
    
}

- (void) clearImageView {
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIButton *) addButtonWithTitle:(NSString *)title action:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:button];
    return button;
}

@end
