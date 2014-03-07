//
//  WordsViewController.h
//  CoreData
//
//  Created by FMCAdmin on 3/7/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vocabulary.h"
#import "Word.h"
#import "EditWordViewController.h"

@interface WordsViewController : UITableViewController
@property (strong, nonatomic) Vocabulary *vocabulary;
-(id) initWithVocabulary: (Vocabulary *) vocabulary;

@end
