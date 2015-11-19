//
//  UILabel+Tools.m
//  TouworldAPPKit
//
//  Created by 李大鹏 on 15/6/25.
//  Copyright (c) 2015年 touworld. All rights reserved.
//

#import "UILabel+Tools.h"

@implementation UILabel (Tools)

+(UILabel *)LabelWithFrame:(CGRect)frame
                      text:(NSString *)text
                 textColor:(UIColor *)textColor
                      font:(NSInteger)fontSize
             textAlignment:(NSTextAlignment)textAlignment {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:fontSize];
//    label.font = [UIFont fontWithName:@"经典细圆简" size:fontSize];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = textAlignment;
    return label;
}

@end
