//
//  UIBarButtonItem+Tools.h
//  TouworldAPPKit
//
//  Created by 李大鹏 on 15/6/26.
//  Copyright (c) 2015年 touworld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Tools)

/**
 *  快速创建一个显示图片的item
 *
 *  @param action   监听方法
 */
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;

@end
