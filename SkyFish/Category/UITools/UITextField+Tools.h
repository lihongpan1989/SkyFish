//
//  UITextField+Tools.h
//  ShowHappinessApp
//
//  Created by 李大鹏 on 15/8/3.
//  Copyright (c) 2015年 showhappiness. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Tools)

+ (UITextField *)userInfoTextFeildWithFrame:(CGRect)frame font:(CGFloat)font image:(NSString *)image placehold:(NSString *)placehold;

+ (instancetype)textFieldWithFrame:(CGRect)frame font:(NSInteger)font placehold:(NSString *)placehold backgroundColor:(UIColor *)backgroundColor leftWidth:(CGFloat)leftWidth;

+ (instancetype)textFieldWithFrame:(CGRect)frame font:(NSInteger)font placehold:(NSString *)placehold;

@end
