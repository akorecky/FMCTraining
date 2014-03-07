//
//  DatabaseViewController.m
//  Database
//
//  Created by FMCAdmin on 3/7/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "DatabaseViewController.h"

@interface DatabaseViewController ()

@end

@implementation DatabaseViewController


NSMutableArray *rows;

- (void)viewDidLoad
{
    rows = [[NSMutableArray alloc] init];
    [super viewDidLoad];
    [self openDB];
    [self createTableNamed:@"Contacts" withField1:@"email" withField2:@"name" ];
    for (int i= 0; i<=2; i++) {
        NSString *email = [[NSString alloc] initWithFormat:@"user%d@learn2develop.net", i];
        NSString *name = [[NSString alloc] initWithFormat:@"user %d", i];
        [self insertRecordIntoTableNamed:@"Contacts" withField1:@"email"
                             field1Value:email andField2:@"name" field2Value:name];
    }
    [self getAllRowsFromTableNamed:@"Contacts"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getAllRowsFromTableNamed:(NSString *)tableName {
    NSString *qsq1 = [NSString stringWithFormat:@"SELECT * FROM %@", tableName];
    sqlite3_stmt *statment;
    NSLog(@"Database Contains: ");
    if(sqlite3_prepare_v2(db,[qsq1 UTF8String], -1, &statment, nil) == SQLITE_OK) {
        while (sqlite3_step(statment) == SQLITE_ROW) {
            char *field1 = (char *) sqlite3_column_text(statment, 0),
            *field2 = (char *) sqlite3_column_text(statment, 1);
            NSLog(@"%@ - %@", [[NSString alloc] initWithUTF8String:field1] , [[NSString alloc] initWithUTF8String:field2] );
            
            [rows addObject:[[NSString alloc] initWithUTF8String:field1] , [[NSString alloc] initWithUTF8String:field2]];
            [rows addObject:[[NSString alloc] initWithUTF8String:field2]];
        }
    }
}

-(void)openDB {
    if (sqlite3_open([[self filePath] UTF8String ], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0, @"Database failed to open.");
    }
}

-(void)createTableNamed:(NSString *)tableName withField1:(NSString *) field1
             withField2:(NSString *)field2 {
    char *err;
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' ('%@' "
                     "TEXT PRIMARY KEY, '%@' TEXT);", tableName, field1, field2];
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0, @"Table failed to create. %s", err);
    }
    
    NSLog(@"Table Created.");
}
-(void)insertRecordIntoTableNamed:(NSString *)tableName withField1:(NSString *)field1 field1Value:(NSString *)field1Value andField2:(NSString *)field2 field2Value:(NSString *)field2Value {
    char *err;
    NSString *sql = [NSString stringWithFormat:@"INSERT OR REPLACE INTO '%@' ('%@', '%@')"
                     "VALUES ('%@', '%@')", tableName, field1, field2, field1Value, field2Value];
    NSLog(@"sql [%@", sql);
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0, @"Error Updating Table. %s", err);
    }
}

-(NSString *)filePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [[paths objectAtIndex:0] stringByAppendingPathComponent:@"database.sql"];
}
                               

#pragma mark    - TABLE VIEW METHODS :
//required by uitableview delegate and uitableviewdatasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return rows.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
                            
@end
