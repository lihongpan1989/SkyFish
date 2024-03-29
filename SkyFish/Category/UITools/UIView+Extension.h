//
//  UIView+Extension.h
//
//  Created by lidapeng on 15/1/4.
//  Copyright (c) 2015年 lidapeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, kScaleMoveDirection) {
    kScaleMoveDirectionX,
    kScaleMoveDirectionY
};

@interface UIView (Extension)

- (instancetype)scaleAdaptive;

- (instancetype)midBetweenAdaptiveWithLeftView:(UIView *)leftView rightView:(UIView *)rightView;

+ (CGFloat)adaptiveHeightWithHeight:(CGFloat)height;

// 自动生成get,set方法的声明,在分类里面用@property不会帮你自动生成带下划线的成员属性
@property (nonatomic, assign) CGFloat  x;
@property (nonatomic, assign) CGFloat  y;
@property (nonatomic, assign) CGFloat  width;
@property (nonatomic, assign) CGFloat  height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGFloat maxY;
@property (nonatomic, assign) CGFloat maxX;

@end
