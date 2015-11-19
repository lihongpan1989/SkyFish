//
//  UIImage+Tint.m
//  TouworldAPPKit
//
//  Created by 李大鹏 on 15/6/26.
//  Copyright (c) 2015年 touworld. All rights reserved.
//

#import "UIImage+Tint.h"

@implementation UIImage (Tint)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
