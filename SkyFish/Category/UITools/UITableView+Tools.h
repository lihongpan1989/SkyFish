//
//  UITableView+Tools.h
//  congcongzujiKit
//
//  Created by 李大鹏 on 15/7/13.
//  Copyright (c) 2015年 touworld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UITableView (Tools)

@end

@interface UITableView (EmptyView)

@property (nonatomic, strong) UIView *eV_emptyView;
@property (nonatomic, assign) BOOL eV_hideSeparatorLinesWhenShowingEmptyView;

@end

@protocol UITableViewEmptyViewDataSource <UITableViewDataSource>
@optional
- (BOOL)tableViewShouldBypassEmptyView:(UITableView *)tableView;
@end