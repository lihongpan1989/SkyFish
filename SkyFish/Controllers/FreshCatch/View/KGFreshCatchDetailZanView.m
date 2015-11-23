//
//  KGFreshCatchDetailZanView.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/22.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGFreshCatchDetailZanView.h"
#import "KGFreshCatchCellFrame.h"
#import "KGFreshCatchUser.h"
#import "KGFreshCatchPraiseMember.h"
#import "UIImageView+WebCache.h"
#define CZStatusCellMargin 10
#define CZNameFont [UIFont systemFontOfSize:13]
#define CZTimeFont [UIFont systemFontOfSize:12]
#define CZSourceFont CZTimeFont
#define CZTextFont [UIFont systemFontOfSize:15]
#define CZScreenW [UIScreen mainScreen].bounds.size.width
@interface KGFreshCatchDetailZanView ()

@property (nonatomic, weak) UILabel *detailLabel;

@property (nonatomic, weak) UIView *topLine;

@property (nonatomic, weak) UIView *downLine;

@end
@implementation KGFreshCatchDetailZanView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 添加所有子控件
        [self setUpAllChildView];
        self.userInteractionEnabled = YES;
        
    }
    return self;
}
-(void)setUpAllChildView
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:view];
    _topLine = view;
    
    UIView *view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:view1];
    _downLine = view1;
    
    // 转发
    NSString *addressString = @"觉得很赞";
    UILabel *address = [[UILabel alloc] init];
    address.font = CZNameFont;
    address.text = addressString;
    [self addSubview:address];
    _detailLabel = address;
    

    CGSize labelSize = [addressString sizeWithFont:CZNameFont];
    
    int btnCount = (CZScreenW - 2*CZStatusCellMargin - labelSize.width)/(34+CZStatusCellMargin/2);
    
    for (int i = 0; i < btnCount; i++) {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.contentMode = UIViewContentModeScaleAspectFill;
        imageV.userInteractionEnabled = YES;
        imageV.layer.masksToBounds = YES;
        imageV.layer.cornerRadius = 17;
        // 裁剪图片，超出控件的部分裁剪掉
        imageV.clipsToBounds = YES;
        imageV.tag = i+10;
        // 添加点按手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [imageV addGestureRecognizer:tap];
        [self addSubview:imageV];
    }
}
-(void)tap:(UITapGestureRecognizer *)gestrue
{
    MyLog(@"%s",__func__);
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.topLine.frame = CGRectMake(CZStatusCellMargin, 0, kSizeOfScreen.width-2*CZStatusCellMargin, 1);
    self.downLine.frame = CGRectMake(0, 43, kSizeOfScreen.width, 1);
    
    CGSize labelSize = [@"觉得很赞" sizeWithFont:CZNameFont];
    _detailLabel.frame = CGRectMake(CZScreenW - CZStatusCellMargin - labelSize.width, 0, labelSize.width, self.height);
    
    int btnCount = (CZScreenW - 2*CZStatusCellMargin - labelSize.width)/(34+CZStatusCellMargin/2);
//    CGFloat x = CZStatusCellMargin;
//    CGFloat y = 0;
    CGFloat w = 34;
    CGFloat h = 34;
    // 计算显示出来的imageView
    for (int i = 0; i < btnCount; i++) {
        UIImageView *imageV = [self viewWithTag:i+10];
        CGFloat x = i * (w + 5)+CZStatusCellMargin;
        imageV.frame = CGRectMake(x, 5, w, h);
    }
}
-(void)setStatus:(KGFreshCatchCellFrame *)status
{
    _status = status;
    CGSize labelSize = [@"觉得很赞" sizeWithFont:CZNameFont];
    int count = (CZScreenW - 2*CZStatusCellMargin - labelSize.width)/(34+CZStatusCellMargin/2);
    NSArray *array = [NSArray arrayWithArray:_status.status.praiseMember];
    for (int i = 0; i < count; i++) {
        
        
        UIImageView *imageV = [self viewWithTag:i+10];
        if (array.count>count) {//只显示cout个数据
            KGFreshCatchPraiseMember *member = array[i];
            // 获取图片链接
            NSString *photo = member.avatar;
            imageV.hidden = NO;
            // 赋值
            [imageV sd_setImageWithURL:[NSURL URLWithString:photo] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
        }else{//只显示有的数据
            if (i < array.count) { // 显示
                imageV.hidden = NO;
                KGFreshCatchPraiseMember *member = array[i];
                // 获取图片链接
                NSString *photo = member.avatar;
                // 赋值
                [imageV sd_setImageWithURL:[NSURL URLWithString:photo] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
            }else{
                imageV.hidden = YES;
            }
        }
    }
}
@end
