//
//  VocabularyViewController.m
//  CoreData
//
//  Created by FMCAdmin on 3/7/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "VocabularyViewController.h"

@interface VocabularyViewController ()

@end

@implementation VocabularyViewController

-(id)initWithManagedObjectContext:(NSManagedObjectContext *)context {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.managedObjectContext = context;
    }
    return self;
}

-(void) fetchVocabularies {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Voacbulary"];
    NSString *cacheName = [@"Voabulary" stringByAppendingString:@"Cache"];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    
    [request setSortDescriptors:@[sortDescriptor]];
    
    self.fetchedResultController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:cacheName];
    
    NSError *error;
    if (! [self.fetchedResultController performFetch:&error]) {
        NSLog(@"Fetched FAILED, reason = %@", error);
    }
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Vocabularies";
    
    [self fetchVocabularies];
    
    if (self.fetchedResultController.fetchedObjects.count == 0) {
        NSEntityDescription *vocabularyEntityDescription = [NSEntityDescription entityForName:@"Vocabulary" inManagedObjectContext:self.managedObjectContext];
        Vocabulary *spanishVocabulary = (Vocabulary *) [[NSManagedObject alloc] initWithEntity:vocabularyEntityDescription insertIntoManagedObjectContext:self.managedObjectContext];
        
        spanishVocabulary.name = @"Spanish";
        NSError *error;
        
        if (! [self.managedObjectContext save:&error]) {
            NSLog(@"ERROR SAVING CONTEXT!! Reason: %@", error);
        }
        
        [self fetchVocabularies];

    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.fetchedResultController.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell...
    Vocabulary *tempVocab = (Vocabulary *) [self.fetchedResultController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = tempVocab.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", tempVocab.words.count];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
