//
//  WordsViewController.m
//  CoreData
//
//  Created by FMCAdmin on 3/7/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "WordsViewController.h"

@interface WordsViewController ()

@end

@implementation WordsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithVocabulary:(Vocabulary *)vocabulary {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.vocabulary = vocabulary;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.vocabulary.name;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    self.navigationItem.rightBarButtonItem = addButton;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void) add {
    NSEntityDescription *wordEntityDescription = [NSEntityDescription entityForName:@"Word" inManagedObjectContext:self.vocabulary.managedObjectContext];
    Word *newWord = (Word *) [[NSManagedObject alloc] initWithEntity:wordEntityDescription insertIntoManagedObjectContext:self.vocabulary.managedObjectContext];
    
    [EditWordViewController editWord:newWord inNavigationController:self.navigationController completion:^(EditWordViewController *sender, BOOL canceled)
     {
         if(canceled)
         {
             [self.vocabulary.managedObjectContext deleteObject:newWord];
         } else {
             [self.vocabulary addWordsObject:newWord];
             
             NSError *error;
             if (! [self.vocabulary.managedObjectContext save:&error]) {
                 NSLog(@"Error saving context: %@", error);
             }
         }
         
         [self.navigationController popViewControllerAnimated:YES];
     }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Word *word = [self.vocabulary.words.allObjects objectAtIndex:indexPath.row];
    [EditWordViewController editWord:word inNavigationController:self.navigationController completion:^(EditWordViewController *sender, BOOL cancelled) {
        NSError *error;
        if (![self.vocabulary.managedObjectContext save:&error]) {
            NSLog(@"Error Saving Context: %@", error);
        }
        [self.tableView reloadData];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
}

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
    return self.vocabulary.words.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell...
    Word *word = [self.vocabulary.words.allObjects objectAtIndex:indexPath.row];
    cell.textLabel.text = word.word;
    cell.detailTextLabel.text = word.translation;
    
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
