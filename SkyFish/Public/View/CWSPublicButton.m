//
//  CWSPublicButton.m
//  测试demo
//
//  Created by 李散 on 15/9/23.
//  Copyright (c) 2015年 cheweishi. All rights reserved.
//

#import "CWSPublicButton.h"

@implementation CWSPublicButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4;
        self.backgroundColor = KMainColor;
    }
    return self;
}

@end
