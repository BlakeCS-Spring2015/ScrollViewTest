//
//  ImageScrollView.m
//  ScrollViewTest
//
//  Created by Ben Weinshel on 3/18/15.
//  Copyright (c) 2015 The Blake School. All rights reserved.
//

#import "ImageScrollView.h"
#import "ViewController.h"

@implementation ImageScrollView

- (instancetype)initWithImage:(UIImage *)image
{
    self = [self initWithFrame:RECTANGLE];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"tesla.jpg"];
        
        self.imageView = [[UIImageView alloc] initWithImage:image];
        //
        //    self.scrollView.imageViewToScroll = self.imageView;
        //
        //    [self.scrollView addSubview:self.imageView];
        //
        //    CGFloat zoomFactor;
        //
        //    if (image.size.width >= 1024.0) {
        //        zoomFactor =  1024.0 / image.size.width;
        //    }
        //    else {
        //        zoomFactor = 768.0 / image.size.height;
        //    }
        //
        //    [self.scrollView setMinimumZoomScale:zoomFactor];
        //    [self.scrollView setZoomScale:zoomFactor];
    }
    return self
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize boundsSize = self.bounds.size;
    CGRect frameToCenter = self.imageViewToScroll.frame;
    
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width)
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    else
        frameToCenter.origin.x = 0;

    // center vertically
    if (frameToCenter.size.height < boundsSize.height)
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    else
        frameToCenter.origin.y = 0;

    self.imageViewToScroll.frame = frameToCenter;

    
}

@end
