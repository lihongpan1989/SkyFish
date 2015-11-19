//
//  UIView+Extension.m
//
//  Created by lidapeng on 15/1/4.
//  Copyright (c) 2015年 lidapeng. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Tools)

//- (instancetype)scaleAdaptive
//{
//    
//    CGFloat scale = [UIScreen mainScreen].bounds.size.width / kBaseScreenWidth;
//    self.transform = CGAffineTransformMakeScale(scale, scale);
//    
//    CGRect frameT = self.frame;
//    CGFloat scaleLength = kBaseScreenWidth * (scale - 1) * 0.5;
//    frameT.origin.x += scaleLength;
//    frameT.origin.y += kSelfHeight * (scale - 1) * 0.5;
//    
//    self.frame = frameT;
//    
//    return self;
//    
//}
//
//+ (CGFloat)adaptiveHeightWithHeight:(CGFloat)height
//{
//    CGFloat scale = [UIScreen mainScreen].bounds.size.width / kBaseScreenWidth;
//    return height *scale;
//}
//
//- (instancetype)rightAdaptive
//{
//    CGFloat scale = [UIScreen mainScreen].bounds.size.width / kBaseScreenWidth;
//    
//    CGRect frameT = self.frame;
//    frameT.origin.x *= scale;
//    self.frame = frameT;
//    
//    return self;
//}

- (instancetype)midBetweenAdaptiveWithLeftView:(UIView *)leftView rightView:(UIView *)rightView
{
    CGRect selfFrame = self.frame;
    CGRect leftFrame = leftView.frame;
    CGRect rightFrame = rightView.frame;
    
    CGFloat finalX = CGRectGetMaxX(leftFrame) + (CGRectGetMinX(rightFrame) - CGRectGetMaxX(leftFrame) - selfFrame.size.width) * 0.5;
    
    selfFrame.origin.x = finalX;
    self.frame = selfFrame;
    
    return self;
}

@end


@implementation UIView (Extension)
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

////////////////////////////////////////////////////
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

////////////////////////////////////////////////////
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

////////////////////////////////////////////////////
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

////////////////////////////////////////////////////
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

////////////////////////////////////////////////////
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

////////////////////////////////////////////////////
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

////////////////////////////////////////////////////
- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

////////////////////////////////
- (CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}

@end
