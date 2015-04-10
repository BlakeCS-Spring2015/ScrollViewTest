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
@property (strong, nonatomic) IBOutlet UIImageView *instructionImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Choose the image
    UIImage *theImage = [UIImage imageNamed:@"tesla.jpg"];
    
    // Initialize an instance of the ImageScrollView class with our image
    // This calls the initWithImage function in ImageScrollView.m
    ImageScrollView *scrollView = [[ImageScrollView alloc] initWithImage:theImage];
    
    // Add the ImageScrollView we just created into the view controller
    [self.view addSubview:scrollView];
    
    self.scrollView = scrollView;
    self.scrollView.delegate = self;
}
    -(void)hideImage:(UIImageView *)image{ image.hidden = YES;
    
}
    
- (void) viewDidAppear:(BOOL)animated{
    UIImage *instructionimage = [UIImage imageNamed:@"imgres-2.jpg"];
    self.instructionImage.image = instructionimage;
    [self.view bringSubviewToFront:self.instructionImage];
    [self performSelector:@selector(hideImage:) withObject:self.instructionImage afterDelay:2.0];
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
