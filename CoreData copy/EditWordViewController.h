//
//  EditWordViewController.h
//  CoreData
//
//  Created by FMCAdmin on 3/7/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"

@class EditWordViewController;

typedef void (^EditWordViewControllerCompletionHandler)(EditWordViewController *sender, BOOL cancelled);

@interface EditWordViewController : UIViewController {
@private EditWordViewControllerCompletionHandler _completionHandler;
    Word *_word;
}


@property (weak, nonatomic) IBOutlet UITextField *wordTextField;
@property (weak, nonatomic) IBOutlet UITextField *translationTextField;

-(id) initWithWord:(Word *)word
        completion:(EditWordViewControllerCompletionHandler) completionHandler;

+(void)editWord:(Word *)word inNavigationController:(UINavigationController *)navigationController completion:(EditWordViewControllerCompletionHandler)completionHandler;


@end
