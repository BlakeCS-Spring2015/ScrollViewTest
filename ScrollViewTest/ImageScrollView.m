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
    CGRect boundsFrame = CGRectMake(0, 0, 1024.0, 768.0);
    self = [self initWithFrame:boundsFrame];
    if (self) {
        
        // Initialize a UIImageView with the image that was passed from ViewController.m
        self.imageViewToScroll = [[UIImageView alloc] initWithImage:image];
        
        // Add that image view as a subview of the scroll view
        [self addSubview:self.imageViewToScroll];
    
        // The rest of this function scales the image to the proper size on load
        CGFloat zoomFactor;
        
        if (image.size.width >= 1024.0) {
            zoomFactor =  1024.0 / image.size.width;
        }
        else {
            zoomFactor = 768.0 / image.size.height;
        }
    
        [self setMinimumZoomScale:zoomFactor];
        [self setZoomScale:zoomFactor];
    }
    return self;
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
    
    // center horizontally when image is taller than it is wide
    // the origin is the top left corner of the object
    if (frameToCenter.size.width < boundsSize.width)
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    else
        frameToCenter.origin.x = 0;

    // center vertically when image is wider than it is tall
    if (frameToCenter.size.height < boundsSize.height)
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    else
        frameToCenter.origin.y = 0;

    self.imageViewToScroll.frame = frameToCenter;

    
}

@end
