//
//  ViewController.m
//  ScrollViewTest
//
//  Created by Sean Hickey on 3/18/15.
//  Copyright (c) 2015 The Blake School. All rights reserved.
//

#import "ViewController.h"
#import "ImageScrollView.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet ImageScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"stuff.jpg"];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    
    self.scrollView.contentSize = CGSizeMake(1024.0, 768.0);
    
 //   self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.scrollView.imageViewToScroll = self.imageView;
    
    [self.scrollView addSubview:self.imageView];
    
   // CGSize boundsSize = self.scrollView.bounds.size;
    


    // Calculate image aspect ratio
    CGFloat iPadAspectRatio = (1024.0 / 768.0);
    CGFloat imageAspectRatio = (image.size.width / image.size.height);
    
    CGFloat zoomFactor;
    if (imageAspectRatio > iPadAspectRatio) {
        // Wider aspect
        zoomFactor =  1024.0 / image.size.width;
    }
    else {
        // Taller aspect
        zoomFactor = 768.0 / image.size.height;
    }
    
    [self.scrollView setMinimumZoomScale:zoomFactor];
    [self.scrollView setZoomScale:zoomFactor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(ImageScrollView *)scrollView
{
    return self.scrollView.imageViewToScroll;
}

- (void)scrollViewDidEndZooming:(ImageScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    
}

@end
