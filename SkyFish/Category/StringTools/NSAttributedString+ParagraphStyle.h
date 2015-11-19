//
//  NSAttributedString+ParagraphStyle.h
//  QieyouVisitor
//
//  Created by 李大鹏 on 15/3/30.
//  Copyright (c) 2015年 lidapeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (ParagraphStyle)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string lineSpacing:(CGFloat)lineSpacing textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize;

+ (CGFloat)contentHeightWithText:(NSString *)text width:(CGFloat)width fontSize:(CGFloat)fontSize lineSpacing:(CGFloat)lineSpacing;

@end
