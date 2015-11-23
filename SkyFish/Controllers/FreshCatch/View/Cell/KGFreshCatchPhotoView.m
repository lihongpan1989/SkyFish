//
//  KGFreshCatchPhotoView.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/21.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGFreshCatchPhotoView.h"
#import "UIImageView+WebCache.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
@implementation KGFreshCatchPhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //        self.backgroundColor = [UIColor redColor];
        self.userInteractionEnabled = YES;
        // 添加9个子控件
        
        [self setUpAllChildView];
        
    }
    return self;
}
// 添加9个子控件
- (void)setUpAllChildView
{
    for (int i = 0; i < 9; i++) {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.contentMode = UIViewContentModeScaleAspectFill;
        imageV.userInteractionEnabled = YES;
        // 裁剪图片，超出控件的部分裁剪掉
        imageV.clipsToBounds = YES;
        imageV.tag = i;
        // 添加点按手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [imageV addGestureRecognizer:tap];
        [self addSubview:imageV];
    }
}
#pragma mark - 点击图片的时候调用
- (void)tap:(UITapGestureRecognizer *)tap
{
    UIImageView *tapView = (UIImageView*)tap.view;
    // CZPhoto -> MJPhoto
    int i = 0;
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSString *photo in _pic_urls) {
        
        MJPhoto *p = [[MJPhoto alloc] init];
        NSString *urlStr = photo;
        p.url = [NSURL URLWithString:urlStr];
        p.index = i;
        p.srcImageView = tapView;
        [arrM addObject:p];
        i++;
    }
    
    // 弹出图片浏览器
    // 创建浏览器对象
    MJPhotoBrowser *brower = [[MJPhotoBrowser alloc] init];
    // MJPhoto
    brower.photos = arrM;
    brower.currentPhotoIndex = tapView.tag;
    [brower show];
}
- (void)setPic_urls:(NSArray *)pic_urls
{
    // 4
    _pic_urls = pic_urls;
    int count = (int)self.subviews.count;
    for (int i = 0; i < count; i++) {
        
        UIImageView *imageV = self.subviews[i];
        
        if (i < _pic_urls.count) { // 显示
            imageV.hidden = NO;
            
            // 获取图片链接
            NSString *photo = _pic_urls[i];
            
            // 赋值
            [imageV sd_setImageWithURL:[NSURL URLWithString:photo] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
        }else{
            imageV.hidden = YES;
        }
    }
}

// 计算尺寸
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 70;
    CGFloat h = 70;
    CGFloat margin = 10;
    int col = 0;
    int rol = 0;
    int cols = _pic_urls.count==4?2:3;
    // 计算显示出来的imageView
    for (int i = 0; i < _pic_urls.count; i++) {
        col = i % cols;
        rol = i / cols;
        UIImageView *imageV = self.subviews[i];
        x = col * (w + margin);
        y = rol * (h + margin);
        imageV.frame = CGRectMake(x, y, w, h);
    }
}
@end
