//
//  EditWordViewController.m
//  CoreData
//
//  Created by FMCAdmin on 3/7/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "EditWordViewController.h"

@interface EditWordViewController ()

@end

@implementation EditWordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithWord:(Word *)word completion:(EditWordViewControllerCompletionHandler)completionHandler {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _completionHandler = completionHandler;
        _word = word;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Edit Word";
    
    self.wordTextField.text = _word.word;
    self.translationTextField.text = _word.translation;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(void)editWord:(Word *)word inNavigationController:(UINavigationController *)navigationController completion:(EditWordViewControllerCompletionHandler)completionHandler {
    EditWordViewController *editWordViewController = [[EditWordViewController alloc] initWithWord:word completion:completionHandler];
    [navigationController pushViewController:editWordViewController animated:YES];
}
-(void) done {
    _word.word = self.wordTextField.text;
    _word.translation = self.translationTextField.text;
    _completionHandler(self, NO);
}

-(void) cancel {
    _completionHandler(self, YES);
}


@end
