//
//  ImageGalleryViewController.m
//  ImageGallery
//
//  Created by FMCAdmin on 3/3/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "ImageGalleryViewController.h"

@interface ImageGalleryViewController ()

@end

@implementation ImageGalleryViewController
@synthesize pageControl, imageView1, imageView2;

- (void)viewDidLoad
{
    [super viewDidLoad];
	[imageView1 setImage:[UIImage imageNamed:@"speed_skate.jpeg"]];
    tmpImageView = imageView2;
    [imageView1 setHidden:NO];
    [imageView2 setHidden:YES];
    
    [pageControl addTarget:self
                    action:@selector(pageTurning)
          forControlEvents:UIControlEventValueChanged];
    prevPage = 0;
    
}

- (void)pageTurning {
    NSInteger nextPage = [pageControl currentPage];
    NSLog(@"nextPage = %i, prevPage = %i", nextPage, prevPage);
    switch (nextPage) {
        case 0:
            [tmpImageView setImage:
             [UIImage imageNamed: @"bejing_2008.jpeg"]];
            break;
        case 1:
            [tmpImageView setImage:
             [UIImage imageNamed: @"water.jpeg"]];
            break;
        case 2:
            [tmpImageView setImage:
             [UIImage imageNamed: @"olympics.jpeg"]];
            break;
        case 3:
            [tmpImageView setImage:
             [UIImage imageNamed: @"sochi_2014.jpeg"]];
            break;
        case 4:
            [tmpImageView setImage:
             [UIImage imageNamed: @"sochi.jpeg"]];
            break;
        default:
            NSLog(@"There was an issue for %li", (long)nextPage);
            break;
    }
    
    if(tmpImageView.tag == 0) {
        tmpImageView = imageView2;
        bgImageView = imageView1;
    } else {
        tmpImageView = imageView1;
        bgImageView = imageView2;
    }
    
    UIViewAnimationOptions transitionOptions;
    
    if (nextPage > prevPage) {
        transitionOptions = UIViewAnimationOptionTransitionFlipFromLeft;
    } else {
        transitionOptions = UIViewAnimationOptionTransitionFlipFromRight;
    }
    
    [UIView transitionWithView:tmpImageView duration:.5
                       options:transitionOptions
                    animations:^{ [tmpImageView setHidden:YES]; }
                    completion:NULL];
    
    [UIView transitionWithView:bgImageView duration:.5
                       options:transitionOptions
                    animations:^{ [bgImageView setHidden:NO]; }
                    completion:NULL];
    
    prevPage = nextPage;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
