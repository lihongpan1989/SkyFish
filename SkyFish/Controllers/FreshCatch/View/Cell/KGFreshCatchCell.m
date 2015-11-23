//
//  KGFreshCatchCell.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/21.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGFreshCatchCell.h"
#import "KGFreshCatchOriginalView.h"
#import "KGFreshCatchToolBar.h"

#import "KGFreshCatchCellFrame.h"
#import "KGFreshCatchUser.h"
@interface KGFreshCatchCell ()

@property (nonatomic, weak) KGFreshCatchOriginalView *originalView;
@property (nonatomic, weak)  KGFreshCatchToolBar *toolBar;

@end

@implementation KGFreshCatchCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 添加所有子控件
        [self setUpAllChildView];
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

// 添加所有子控件
- (void)setUpAllChildView
{
    // 内容部分
    KGFreshCatchOriginalView *originalView = [[KGFreshCatchOriginalView alloc] init];
    [self addSubview:originalView];
    _originalView = originalView;
    
    // 工具条
    KGFreshCatchToolBar *toolBar = [[KGFreshCatchToolBar alloc] init];
    [self addSubview:toolBar];
    _toolBar = toolBar;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
- (void)setStatusF:(KGFreshCatchCellFrame *)statusF
{
    _statusF = statusF;
    
    // 设置原创微博frame
    _originalView.frame = statusF.originalViewFrame;
    _originalView.statusF = statusF;
    
    // 设置工具条frame
    _toolBar.frame = statusF.toolBarFrame;
    _toolBar.status = statusF.status;
}

@end
