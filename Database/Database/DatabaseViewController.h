//
//  DatabaseViewController.h
//  Database
//
//  Created by FMCAdmin on 3/7/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface DatabaseViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    sqlite3 *db;
}

-(NSString *)filePath;
-(void)openDB;
-(void)createTableNamed:(NSString *)tableName
             withField1:(NSString *) field1
             withField2:(NSString *)field2;
-(void)insertRecordIntoTableNamed:(NSString *) tableName
             withField1:(NSString *) field1
            field1Value:(NSString *) field1Value
              andField2:(NSString *) field2
            field2Value:(NSString *) field2Value;
-(void) getAllRowsFromTableNamed: (NSString *) tableName;



@end
