//
//  UITextField+Tools.m
//  ShowHappinessApp
//
//  Created by 李大鹏 on 15/8/3.
//  Copyright (c) 2015年 showhappiness. All rights reserved.
//

#import "UITextField+Tools.h"
#import "UIColor+HNExtensions.h"
@implementation UITextField (Tools)

+ (UITextField *)userInfoTextFeildWithFrame:(CGRect)frame font:(CGFloat)font image:(NSString *)image placehold:(NSString *)placehold
{
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    
    textField.backgroundColor = [UIColor whiteColor];
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 48, frame.size.height)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
    imageView.center = leftView.center;
    
    [leftView addSubview:imageView];
    
    textField.leftView = leftView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    textField.layer.cornerRadius = 5;
    textField.clipsToBounds = YES;
    
    textField.placeholder = placehold;
    
    textField.font = [UIFont systemFontOfSize:font];
    
    textField.layer.borderWidth = 0.5;
    textField.layer.borderColor = kHexColor(@"#e9e9e9").CGColor;
    
    return textField;
    
}

+ (instancetype)textFieldWithFrame:(CGRect)frame font:(NSInteger)font placehold:(NSString *)placehold
{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.font = [UIFont systemFontOfSize:font];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.placeholder = placehold;
    
    return textField;
}

+ (instancetype)textFieldWithFrame:(CGRect)frame font:(NSInteger)font placehold:(NSString *)placehold backgroundColor:(UIColor *)backgroundColor leftWidth:(CGFloat)leftWidth
{
    UITextField *textField = [UITextField textFieldWithFrame:frame font:font placehold:placehold];
    
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.layer.cornerRadius = 3.0f;
    textField.clipsToBounds = YES;
    textField.backgroundColor = backgroundColor;
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftWidth, 10)];
    textField.leftView = leftView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    return textField;
    
}

@end
