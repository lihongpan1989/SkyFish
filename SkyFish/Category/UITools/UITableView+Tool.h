//
//  UITableView+Tool.h
//  ToolsKit
//
//  Created by 李大鹏 on 14-11-26.
//  Copyright (c) 2014年 lidapeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Tool)

@end

@interface UITableView (AnimationControl)

- (void)beginSmartUpdatesForDuration:(NSTimeInterval)duration;
- (void)endSmartUpdates;

- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation completion:(void (^)(void))completion;
- (void)insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation completion:(void (^)(void))completion;

- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation completion:(void (^)(void))completion;
- (void)deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation completion:(void (^)(void))completion;

- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation completion:(void (^)(void))completion;
- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation completion:(void (^)(void))completion;

- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath completion:(void (^)(void))completion;
- (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection completion:(void (^)(void))completion;

@end

@interface UITableView (EmptyView)

@property (nonatomic, strong) IBOutlet UIView *eV_emptyView;
@property (nonatomic, assign) BOOL eV_hideSeparatorLinesWhenShowingEmptyView;

@end


@protocol UITableViewEmptyViewDataSource <UITableViewDataSource>
@optional
- (BOOL)tableViewShouldBypassEmptyView:(UITableView *)tableView;
@end