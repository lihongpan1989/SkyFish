//
//  UIBarButtonItem+Tools.m
//  TouworldAPPKit
//
//  Created by 李大鹏 on 15/6/26.
//  Copyright (c) 2015年 touworld. All rights reserved.
//

#import "UIBarButtonItem+Tools.h"

@implementation UIBarButtonItem (Tools)

+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
    button.frame = (CGRect){CGPointZero, button.currentBackgroundImage.size};
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
