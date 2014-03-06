//
//  MDAppMasterViewController.m
//  MDApp
//
//  Created by FMCAdmin on 3/5/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "MDAppMasterViewController.h"

#import "MDAppDetailViewController.h"

@interface MDAppMasterViewController () {
    NSMutableArray *moviesArray;
}
@end

@implementation MDAppMasterViewController
@synthesize movies, years, searchBar;
//- (void)awakeFromNib
//{
//    [super awakeFromNib];
//}

- (void)viewDidLoad
{
// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    movies =  [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Movies" ofType:@"plist"]];
    NSLog(@"movies = %@", movies);
    NSArray *array = [[self.movies allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.years = array;
    
    self.tableView.tableHeaderView = searchBar;
    searchBar.autocorrectionType = UITextAutocorrectionTypeYes;
    
    listOfMovies = [[NSMutableArray alloc] init];

//    for (NSString *year in array) {
//        NSArray *mvs = [movies objectForKey:year];
//        for ( NSString *title in mvs) {
//            [listOfMovies addObject:title];
//        }
//    }
    for (NSString* year in years) {
        [listOfMovies addObjectsFromArray:[movies valueForKeyPath:year]];
    }
    
    searchResult = [[NSMutableArray alloc] init];
    isSearchOn = NO;
    canSelectRow = YES;
    
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)insertNewObject:(id)sender
//{
//    if (!moviesArray) {
//        moviesArray = [[NSMutableArray alloc] init];
//    }
//    [moviesArray insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}

#pragma mark - Table View

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return isSearchOn ? nil : [self.years objectAtIndex:section];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return isSearchOn ? 1 : [self.years count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isSearchOn) {
        return [searchResult count];
    }
    
    return [[self.movies objectForKey:[self.years objectAtIndex:section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    
    if (isSearchOn) {
        cell.textLabel.text = [searchResult objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [[self.movies objectForKey:[self.years objectAtIndex:[indexPath section]]] objectAtIndex:[indexPath row]];
    }

//    NSDate *object = moviesArray[indexPath.row];
    //cell.textLabel.text = @"Movie Title";
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [moviesArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    return YES;
}
 */


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = moviesArray[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return canSelectRow ? indexPath : nil;
}

#pragma mark - Search Methods
-(void) searchBarTextDidBeginEditing:(UISearchBar *)searchBr {
    isSearchOn = YES;
    if (searchBr.text.length > 0) {
        canSelectRow = YES;
        self.tableView.scrollEnabled = YES;
    } else {
        canSelectRow = NO;
        self.tableView.scrollEnabled = NO;
    }
}


- (void) doneSearching:(id)sender {
    isSearchOn = NO;
    canSelectRow = YES;
    self.tableView.scrollEnabled = YES;
    self.navigationItem.rightBarButtonItem = nil;
    
    [searchBar resignFirstResponder];
    [self.tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBr textDidChange:(NSString *)searchText {
    if ([searchText length] > 0) {
        canSelectRow = YES;
        self.tableView.scrollEnabled = YES;
        [self searchMoviesTableView];
    } else {
        canSelectRow = NO;
        self.tableView.scrollEnabled = NO;
    }
    [self.tableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self searchMoviesTableView];
}

- (void) searchMoviesTableView {
    [searchResult removeAllObjects];
    
    for (NSString *str in listOfMovies) {
        if ([str rangeOfString:searchBar.text options:NSCaseInsensitiveSearch].length > 0) {
            [searchResult addObject:str];
        }
    }
}

@end
