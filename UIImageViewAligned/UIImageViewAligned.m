//
//  UIImageViewAligned.m
//  awards
//
//  Created by Andrei Stanescu on 7/29/13.
//  Copyright (c) 2013 Mind Treat Studios. All rights reserved.
//

#import "UIImageViewAligned.h"

@interface UIImageViewAligned()

@property (nonatomic, readonly) UIImageView* realImageView;

@end

@implementation UIImageViewAligned

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self commonInit];
    }
    return self;
}


- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self)
    {
        [self commonInit];
        [_realImageView setImage:image];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
        [self commonInit];
    return self;
}

- (void)commonInit
{
    _alignment = UIImageViewAlignmentMaskCenter;
    
    _realImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [_realImageView setAutoresizingMask: UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [_realImageView setContentMode:self.contentMode];
    [self addSubview:_realImageView];
}

- (UIImage*)image
{
    return _realImageView.image;
}

- (void)setImage:(UIImage *)image
{
    [_realImageView setImage:image];
    [self setNeedsLayout];
}

- (void)setContentMode:(UIViewContentMode)contentMode
{
    [super setContentMode:contentMode];
    [_realImageView setContentMode:contentMode];
    [self setNeedsLayout];
}

- (void)setAlignment:(UIImageViewAlignmentMask)alignment
{
    if (_alignment == alignment)
        return ;
    
    _alignment = alignment;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    CGSize realsize = [self realContentSize];
    
    // Start centered
    CGRect realframe = CGRectMake((self.bounds.size.width - realsize.width)/2, (self.bounds.size.height - realsize.height) / 2, realsize.width, realsize.height);
    
    if ((_alignment & UIImageViewAlignmentMaskLeft) != 0)
        realframe.origin.x = 0;
    else if ((_alignment & UIImageViewAlignmentMaskRight) != 0)
        realframe.origin.x = CGRectGetMaxX(self.bounds) - realframe.size.width;
    
    if ((_alignment & UIImageViewAlignmentMaskTop) != 0)
        realframe.origin.y = 0;
    else if ((_alignment & UIImageViewAlignmentMaskBottom) != 0)
        realframe.origin.y = CGRectGetMaxY(self.bounds) - realframe.size.height;
    
    [_realImageView setFrame:realframe];

}

- (CGSize)realContentSize
{
    CGSize size = self.bounds.size;

    if (_realImageView.image == nil)
        return size;

    switch (self.contentMode)
    {
        case UIViewContentModeScaleAspectFit:
        {
            float scalex = self.bounds.size.width / _realImageView.image.size.width;
            float scaley = self.bounds.size.height / _realImageView.image.size.height;
            float scale = MIN(scalex, scaley);

            size = CGSizeMake(_realImageView.image.size.width * scale, _realImageView.image.size.height * scale);
            break;
        }
            
        case UIViewContentModeScaleAspectFill:
        {
            float scalex = self.bounds.size.width / _realImageView.image.size.width;
            float scaley = self.bounds.size.height / _realImageView.image.size.height;
            float scale = MAX(scalex, scaley);
            
            size = CGSizeMake(_realImageView.image.size.width * scale, _realImageView.image.size.height * scale);
            break;
        }
            
        case UIViewContentModeScaleToFill:
        {
            float scalex = self.bounds.size.width / _realImageView.image.size.width;
            float scaley = self.bounds.size.height / _realImageView.image.size.height;
            
            size = CGSizeMake(_realImageView.image.size.width * scalex, _realImageView.image.size.height * scaley);
            break;
        }

        default:
            size = _realImageView.image.size;
            break;
    }

    return size;
}

@end
