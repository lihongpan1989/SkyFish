//
//  KGMenuHeadBtn.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/18.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGMenuHeadBtn.h"

@implementation KGMenuHeadBtn

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:21];
        self.titleLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
        [self setBackgroundImage:[UIImage imageNamed:@"左侧菜单_背景"] forState:UIControlStateNormal];
        
        self.imageView.layer.masksToBounds = YES;
        self.imageView.layer.cornerRadius = frame.size.height/4;
        self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.imageView.layer.borderWidth = 3.0f;
        self.imageView.layer.shouldRasterize = YES;
        self.imageView.clipsToBounds = YES;

    }
    return self;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect titleTect;
    titleTect = CGRectMake(0, contentRect.size.height*0.75, contentRect.size.width, contentRect.size.height/4);
    return titleTect;
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect imgTect;
    imgTect = CGRectMake(contentRect.size.width/2-contentRect.size.height/4, contentRect.size.height/4, contentRect.size.height/2, contentRect.size.height/2);
    return imgTect;
}
@end
