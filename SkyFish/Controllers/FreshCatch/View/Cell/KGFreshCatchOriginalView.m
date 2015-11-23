//
//  KGFreshCatchOriginalView.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/21.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGFreshCatchOriginalView.h"
#import "KGFreshCatchCellFrame.h"
#import "KGFreshCatchPhotoView.h"
#import "KGFreshCatchUser.h"

#import "UIImageView+WebCache.h"

#define CZStatusCellMargin 10
#define CZNameFont [UIFont systemFontOfSize:13]
#define CZTimeFont [UIFont systemFontOfSize:12]
#define CZSourceFont CZTimeFont
#define CZTextFont [UIFont systemFontOfSize:15]
#define CZScreenW [UIScreen mainScreen].bounds.size.width
@interface KGFreshCatchOriginalView()
// 头像
@property (nonatomic, weak) UIImageView *iconView;

// 昵称
@property (nonatomic, weak) UILabel *nameView;
// 时间
@property (nonatomic, weak) UILabel *timeView;
// 正文
@property (nonatomic, weak) UILabel *textView;
// 配图
@property (nonatomic, weak) KGFreshCatchPhotoView *photosView;

@end

@implementation KGFreshCatchOriginalView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 添加所有子控件
        [self setUpAllChildView];
        self.userInteractionEnabled = YES;
//        self.image = [UIImage imageWithStretchableName:@"timeline_card_top_background"];
    }
    return self;
}

// 添加所有子控件
- (void)setUpAllChildView
{
    // 头像
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
    _iconView = iconView;
    
    // 昵称
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = CZNameFont;
    [self addSubview:nameView];
    _nameView = nameView;
    
    // 时间
    UILabel *timeView = [[UILabel alloc] init];
    timeView.font = CZTimeFont;
    timeView.textColor = [UIColor orangeColor];
    [self addSubview:timeView];
    _timeView = timeView;
    
    // 正文
    UILabel *textView = [[UILabel alloc] init];
    textView.font = CZTextFont;
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
    
    // 配图
    KGFreshCatchPhotoView *photosView = [[KGFreshCatchPhotoView alloc] init];
    [self addSubview:photosView];
    _photosView = photosView;
}

- (void)setStatusF:(KGFreshCatchCellFrame *)statusF
{
    _statusF = statusF;
    
    // 设置frame
    [self setUpFrame];
    // 设置data
    [self setUpData];
    
}
- (void)setUpData
{
    KGFreshCatchUser *status = _statusF.status;
    // 头像
    [_iconView sd_setImageWithURL:[NSURL URLWithString:status.authorAvatar] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    // 昵称
    _nameView.textColor = [UIColor blackColor];
    _nameView.text = status.authorName;
    
    // 时间
    _timeView.text = status.time;
    
    // 正文
    _textView.text = status.content;
    
    // 配图
    _photosView.pic_urls = status.images;
}

- (void)setUpFrame
{
    // 头像
    _iconView.frame = _statusF.originalIconFrame;
    
    // 昵称
    _nameView.frame = _statusF.originalNameFrame;
    
    // 时间 每次有新的时间都需要计算时间frame
    KGFreshCatchUser *status = _statusF.status;
    CGFloat timeX = _nameView.frame.origin.x;
    CGFloat timeY = CGRectGetMaxY( _nameView.frame) + CZStatusCellMargin * 0.5;
    CGSize timeSize = [status.time sizeWithFont:CZTimeFont];
    _timeView.frame = (CGRect){{timeX,timeY},timeSize};
    
    // 正文
    _textView.frame = _statusF.originalTextFrame;
    
    // 配图
    _photosView.frame = _statusF.originalPhotosFrame;
}

@end
