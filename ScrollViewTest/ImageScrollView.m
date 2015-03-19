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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//
//-(void)layoutIfNeeded {
//    CGSize boundsSize = self.bounds.size;
//    CGRect frameToCenter = self.imageViewToScroll.frame;
//    
//    CGFloat zoomFactor;
//    
//    // center horizontally
//    if (frameToCenter.size.width > boundsSize.width)
//        zoomFactor =  boundsSize.width / frameToCenter.size.width;
//    
//    // center vertically
//    if (frameToCenter.size.height > boundsSize.height)
//        zoomFactor =  boundsSize.height / frameToCenter.size.height;
//
//    [self setMinimumZoomScale:zoomFactor];
//    [self setZoomScale:zoomFactor];
//
//}

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

//    [self setMinimumZoomScale:zoomFactor];
//    [self setZoomScale:zoomFactor];
//    
    self.imageViewToScroll.frame = frameToCenter;
    
    
    //    // Calculate image aspect ratio
    //    CGFloat iPadAspectRatio = (1024.0 / 768.0);
    //    CGFloat imageAspectRatio = (image.size.width / image.size.height);
    //
    //    CGFloat zoomFactor;
    //    if (imageAspectRatio > iPadAspectRatio) {
    //        // Wider aspect
    //        zoomFactor =  1024.0 / image.size.width;
    //    }
    //    else {
    //        // Taller aspect
    //        zoomFactor = 768.0 / image.size.height;
    //    }
    //
    //    [self.scrollView setMinimumZoomScale:zoomFactor];
    //    [self.scrollView setZoomScale:zoomFactor];
    
}

@end
