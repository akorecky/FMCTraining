//
//  FilesHandlingViewController.h
//  FilesHandling
//
//  Created by FMCAdmin on 3/6/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilesHandlingViewController : UIViewController
-(NSString *)documentsFolderPath;
-(NSString *)readFromFilePath:(NSString *) filePath;
-(void)writeToFile:(NSString *)text toFileName:(NSString *)filePath;
@end
