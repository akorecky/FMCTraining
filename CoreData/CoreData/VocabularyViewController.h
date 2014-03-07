//
//  VocabularyViewController.h
//  CoreData
//
//  Created by FMCAdmin on 3/7/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vocabulary.h"

@interface VocabularyViewController : UITableViewController <UIAlertViewDelegate>
@property (nonatomic, strong)NSManagedObjectContext *managedObjectContext;
@property(nonatomic, strong) NSFetchedResultsController *fetchedResultController;
-(id)  initWithManagedObjectContext:(NSManagedObjectContext *) context;

@end
