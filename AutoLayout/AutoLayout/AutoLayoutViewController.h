//
//  AutoLayoutViewController.h
//  AutoLayout
//
//  Created by FMCAdmin on 3/6/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoLayoutViewController : UIViewController
@property (strong, nonatomic) UIButton *addButton, *removeButton, *clearButton;
@property (strong, nonatomic) NSMutableArray *imageViews, *imageViewConstraints;



@end
