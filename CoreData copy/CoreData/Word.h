//
//  Word.h
//  CoreData
//
//  Created by FMCAdmin on 3/7/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Word : NSManagedObject

@property (nonatomic, retain) NSString * translation;
@property (nonatomic, retain) NSString * word;
@property (nonatomic, retain) NSManagedObject *vocabulary;

@end
