//
//  Candy.h
//  TableView
//
//  Created by FMCAdmin on 3/5/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Candy : NSObject
@property NSString *name, *imageName, *subTitle;
@property int calories;
@property BOOL imported;

- (id) initWithCandyName: (NSString *)cdy andSubTitle:(NSString *) ttl
            andImageName:(NSString *)img andCalories:(int)cal
             andImported:(BOOL)impt;
@end
