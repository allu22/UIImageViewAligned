//
//  UIImageViewAligned.h
//  awards
//
//  Created by Andrei Stanescu on 7/29/13.
//  Copyright (c) 2013 Mind Treat Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    UIImageViewAlignmentMaskCenter = 0,
    
    UIImageViewAlignmentMaskLeft   = 1,
    UIImageViewAlignmentMaskRight  = 2,
    UIImageViewAlignmentMaskTop    = 4,
    UIImageViewAlignmentMaskBottom = 8,
    
    UIImageViewAlignmentMaskBottomLeft  = UIImageViewAlignmentMaskBottom | UIImageViewAlignmentMaskLeft,
    UIImageViewAlignmentMaskBottomRight = UIImageViewAlignmentMaskBottom | UIImageViewAlignmentMaskRight,
    UIImageViewAlignmentMaskTopLeft     = UIImageViewAlignmentMaskTop | UIImageViewAlignmentMaskLeft,
    UIImageViewAlignmentMaskTopRight    = UIImageViewAlignmentMaskTop | UIImageViewAlignmentMaskRight,
    
}UIImageViewAlignmentMask;



@interface UIImageViewAligned : UIView

- (instancetype)initWithImage:(UIImage *)image;
- (UIImage*)image;
- (void)setImage:(UIImage *)image;

// This property holds the current alignment
@property (nonatomic) UIImageViewAlignmentMask alignment;

@end
