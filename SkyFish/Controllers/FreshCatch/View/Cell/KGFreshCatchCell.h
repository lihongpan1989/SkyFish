//
//  KGFreshCatchCell.h
//  SkyFish
//
//  Created by 李洪攀 on 15/11/21.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KGFreshCatchCellFrame;
@interface KGFreshCatchCell : UITableViewCell

@property (nonatomic, strong) KGFreshCatchCellFrame *statusF;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
