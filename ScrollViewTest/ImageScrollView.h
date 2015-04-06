//
//  ImageScrollView.h
//  ScrollViewTest
//
//  Created by Ben Weinshel on 3/18/15.
//  Copyright (c) 2015 The Blake School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageScrollView : UIScrollView

@property (strong, nonatomic) UIImageView *imageViewToScroll;

- (instancetype)initWithImage:(UIImage *)image;

@end
