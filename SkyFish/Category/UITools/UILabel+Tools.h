//
//  UILabel+Tools.h
//  TouworldAPPKit
//
//  Created by 李大鹏 on 15/6/25.
//  Copyright (c) 2015年 touworld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Tools)

+(UILabel *)LabelWithFrame:(CGRect)frame
                      text:(NSString *)text
                 textColor:(UIColor *)textColor
                      font:(NSInteger)fontSize
             textAlignment:(NSTextAlignment)textAlignment;

@end
