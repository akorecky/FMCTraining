//
//  FilesHandlingViewController.m
//  FilesHandling
//
//  Created by FMCAdmin on 3/6/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "FilesHandlingViewController.h"

@interface FilesHandlingViewController ()

@end

@implementation FilesHandlingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSString *fileName = [[self documentsFolderPath] stringByAppendingPathComponent:@"myTextFile.txt"];
//    
//    [self writeToFile:@"iOS App Development is SO, MUCH, FUN ..." toFileName:fileName];
//    
//    NSString *fileContents = [self readFromFilePath:fileName];
//    
//    NSLog(@"The file's contents are: \n%@", fileContents);
//    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)documentsFolderPath{
    NSArray *pathsArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsFolderDir = [pathsArray objectAtIndex:0];
    
    return documentsFolderDir;
}
-(NSString *)readFromFilePath:(NSString *) filePath{
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSArray *array = [[NSArray alloc]initWithContentsOfFile:filePath];
        return [NSString stringWithFormat:@"%@", [array objectAtIndex:0]];
    }
    return nil;
}
-(void)writeToFile:(NSString *)text toFileName:(NSString *)filePath{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array addObject:text];
    [array writeToFile:filePath atomically:YES];
}

@end
