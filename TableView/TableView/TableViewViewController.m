//
//  TableViewViewController.m
//  TableView
//
//  Created by FMCAdmin on 3/5/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "TableViewViewController.h"

@interface TableViewViewController ()

@end

@implementation TableViewViewController
NSMutableArray *candyArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    candyArray = [[NSMutableArray alloc] init ];
    [candyArray addObject:[[Candy alloc ] initWithCandyName:@"Twix"
                                                andSubTitle:@"Cruchy and Chocolate"
                                               andImageName:@"london_2012.png"
                                                andCalories:120 andImported:NO]];
    [candyArray addObject:[[Candy alloc ] initWithCandyName:@"Sweet Tarts"
                                                andSubTitle:@"Tangy and Frutti"
                                               andImageName:@"bejing_2008.jpeg"
                                                andCalories:200 andImported:YES]];
    [candyArray addObject:[[Candy alloc ] initWithCandyName:@"Milky Way"
                                                andSubTitle:@"Tangy and Frutti"
                                               andImageName:@"sochi.jpeg"
                                                andCalories:200 andImported:YES]];
    [candyArray addObject:[[Candy alloc ] initWithCandyName:@"Hershey's"
                                                andSubTitle:@"Just Chocolately"
                                               andImageName:@"sochi_2014.jpeg"
                                                andCalories:200 andImported:YES]];
    [candyArray addObject:[[Candy alloc ] initWithCandyName:@"Snickers"
                                                andSubTitle:@"Nutty and Chocolate"
                                               andImageName:@"water.jpeg"
                                                andCalories:200 andImported:YES]];
    [candyArray addObject:[[Candy alloc ] initWithCandyName:@"Charelston Chew"
                                                andSubTitle:@"Marshmellow Chew"
                                               andImageName:@"speed_skate.jpeg"
                                                andCalories:200 andImported:YES]];
    [candyArray addObject:[[Candy alloc ] initWithCandyName:@"Sugar Daddy"
                                                andSubTitle:@"Chocolatey Carmel"
                                               andImageName:@"olympics.jpeg"
                                                andCalories:200 andImported:YES]];

    NSLog(@"candyArray = %@", candyArray);
    
}

//required by uitableview delegate and uitableviewdatasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return candyArray.count;
}

//- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 5;
//}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"My Favorite Candides";
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    Candy *candy = [candyArray objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
//    if (candy.imported) {
//        cell.backgroundColor = [UIColor orangeColor];
//    }
    
    NSLog(@"indexPath: (section.row) = %i.%i", indexPath.section, indexPath.row);
    cell.textLabel.text = candy.name;
    cell.detailTextLabel.text = candy.subTitle;
    cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cell.detailTextLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];

    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.imageView.image = [UIImage imageNamed:candy.imageName];
    cell.imageView.frame = CGRectMake(0, 0, 66, 66);
    
    CGSize size = {50,50};
    cell.imageView.image = [self imageWithImage:[UIImage imageNamed:candy.imageName]
                                                       scaledToSize:size];

    
    return cell;
}

//Given a UIImage and a CGSize, this method will return a resized UIImage.
- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    Candy *candy = [candyArray objectAtIndex:indexPath.row];
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@ Candy", candy.name] message:@"This candy is your favorite." delegate:self cancelButtonTitle:@"Yeah" otherButtonTitles:nil, nil];
    
    UITableView[tableView cellForRowAtIndexPath:indexPath];
    
[view show];
    
}

@end
