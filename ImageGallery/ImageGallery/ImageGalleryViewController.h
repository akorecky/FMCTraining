//
//  ImageGalleryViewController.h
//  ImageGallery
//
//  Created by FMCAdmin on 3/3/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageGalleryViewController : UIViewController {
    UIImageView *tmpImageView, *bgImageView;
    NSInteger prevPage;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end
