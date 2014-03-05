//
//  Candy.m
//  TableView
//
//  Created by FMCAdmin on 3/5/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "Candy.h"

@implementation Candy
@synthesize name, imageName, calories, imported, subTitle;
- (id) initWithCandyName: (NSString *)cdy andSubTitle:(NSString *) ttl
      andImageName:(NSString *)img andCalories:(int)cal andImported:(BOOL)impt {
{
    self = [super init];
    if (self) {
        self.name = cdy;
        self.subTitle = ttl;
        self.imageName = img;
        self.calories = cal;
        self.imported = impt;
    }
    return self;
}
}
@end
