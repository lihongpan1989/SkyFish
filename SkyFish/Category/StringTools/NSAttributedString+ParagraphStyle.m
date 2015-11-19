//
//  NSAttributedString+ParagraphStyle.m
//  QieyouVisitor
//
//  Created by 李大鹏 on 15/3/30.
//  Copyright (c) 2015年 lidapeng. All rights reserved.
//

#import "NSAttributedString+ParagraphStyle.h"
#import "UIColor+HNExtensions.h"
@implementation NSAttributedString (ParagraphStyle)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string lineSpacing:(CGFloat)lineSpacing textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.lineSpacing = lineSpacing;// 字体的行间距
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{
                                 
                                 NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                 
                                 NSParagraphStyleAttributeName:paragraphStyle,
                                 
                                 NSForegroundColorAttributeName:textColor
                                 };
    if (string) {
       return [[NSAttributedString alloc] initWithString:string attributes:attributes];
    }
    return nil;
}

+ (CGFloat)contentHeightWithText:(NSString *)text width:(CGFloat)width fontSize:(CGFloat)fontSize lineSpacing:(CGFloat)lineSpacing
{
    if (![text isKindOfClass:[NSString class]] || !text.length) {
        return 0;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;// 字体的行间距 
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSDictionary *attributes = @{
                                 NSParagraphStyleAttributeName:paragraphStyle,
                                 NSFontAttributeName : [UIFont systemFontOfSize:fontSize],
                                 NSForegroundColorAttributeName:kHexColor(@"#333333")
                                 };
    CGSize size = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:options attributes:attributes context:nil].size;
    CGFloat height = ceilf(size.height);
    
    return height;
}

@end
