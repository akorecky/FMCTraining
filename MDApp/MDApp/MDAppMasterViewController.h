//
//  MDAppMasterViewController.h
//  MDApp
//
//  Created by FMCAdmin on 3/5/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDAppMasterViewController : UITableViewController <UISearchBarDelegate> {
    BOOL isSearchOn, canSelectRow;
    NSMutableArray *listOfMovies, *searchResult;
}

@property (nonatomic, strong) NSDictionary *movies;
@property (nonatomic, strong) NSArray *years;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

-(void) doneSearching:(id)sender;
-(void) searchMoviesTableView;


@end
