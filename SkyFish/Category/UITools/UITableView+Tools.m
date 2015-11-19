//
//  UITableView+Tools.m
//  congcongzujiKit
//
//  Created by 李大鹏 on 15/7/13.
//  Copyright (c) 2015年 touworld. All rights reserved.
//

#import "UITableView+Tools.h"

@implementation UITableView (Tools)

@end

static const NSString *EmptyViewAssociatedKey = @"EmptyViewAssociatedKey";
static const NSString *EmptyViewHideSeparatorLinesAssociatedKey = @"EmptyViewHideSeparatorLinesAssociatedKey";
static const NSString *EmptyViewPreviousSeparatorStyleAssociatedKey = @"EmptyViewPreviousSeparatorStyleAssociatedKey";

void EV_swizzle(Class c, SEL orig, SEL new)
{
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    if(class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    else
        method_exchangeImplementations(origMethod, newMethod);
}

@interface UITableView (EmptyViewPrivate)
@property (nonatomic, assign) UITableViewCellSeparatorStyle eV_previousSeparatorStyle;
@end

@implementation UITableView (EmptyView)

#pragma mark Entry

+ (void)load;
{
    Class c = [UITableView class];
    EV_swizzle(c, @selector(reloadData), @selector(eV_reloadData));
    EV_swizzle(c, @selector(layoutSubviews), @selector(eV_layoutSubviews));
}

#pragma mark Properties

- (BOOL)eV_hasRowsToDisplay;
{
    NSUInteger numberOfRows = 0;
    for (NSInteger sectionIndex = 0; sectionIndex < self.numberOfSections; sectionIndex++) {
        numberOfRows += [self numberOfRowsInSection:sectionIndex];
    }
    return (numberOfRows > 0);
}

@dynamic eV_emptyView;
- (UIView *)eV_emptyView;
{
    return objc_getAssociatedObject(self, &EmptyViewAssociatedKey);
}

- (void)setEV_emptyView:(UIView *)value;
{
    if (self.eV_emptyView.superview) {
        [self.eV_emptyView removeFromSuperview];
    }
    objc_setAssociatedObject(self, &EmptyViewAssociatedKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self eV_updateEmptyView];
}

@dynamic eV_hideSeparatorLinesWhenShowingEmptyView;
- (BOOL)eV_hideSeparatorLinesWhenShowingEmptyView
{
    NSNumber *hideSeparator = objc_getAssociatedObject(self, &EmptyViewHideSeparatorLinesAssociatedKey);
    return hideSeparator ? [hideSeparator boolValue] : NO;
}

- (void)setSqEV_hideSeparatorLinesWhenShowingEmptyView:(BOOL)value
{
    NSNumber *hideSeparator = [NSNumber numberWithBool:value];
    objc_setAssociatedObject(self, &EmptyViewHideSeparatorLinesAssociatedKey, hideSeparator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark Updating

- (void)eV_updateEmptyView;
{
    UIView *emptyView = self.eV_emptyView;
    
    if (!emptyView) return;
    
    if (emptyView.superview != self) {
        [self addSubview:emptyView];
    }
    
    // setup empty view frame
    CGRect frame = self.bounds;
    frame.origin = CGPointMake(0, 0);
    frame = UIEdgeInsetsInsetRect(frame, UIEdgeInsetsMake(CGRectGetHeight(self.tableHeaderView.frame), 0, 0, 0));
    frame.size.height -= self.contentInset.top;
    emptyView.frame = frame;
    emptyView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    
    // check available data
    BOOL emptyViewShouldBeShown = (self.eV_hasRowsToDisplay == NO);
    
    // check bypassing
    if (emptyViewShouldBeShown && [self.dataSource respondsToSelector:@selector(tableViewShouldBypassEmptyView:)]) {
        BOOL emptyViewShouldBeBypassed = [(id<UITableViewEmptyViewDataSource>)self.dataSource tableViewShouldBypassEmptyView:self];
        emptyViewShouldBeShown &= !emptyViewShouldBeBypassed;
    }
    
    // hide tableView separators, if present
    if (self.eV_hideSeparatorLinesWhenShowingEmptyView) {
        if (emptyViewShouldBeShown) {
            if (self.separatorStyle != UITableViewCellSeparatorStyleNone) {
                self.eV_previousSeparatorStyle = self.separatorStyle;
                self.separatorStyle = UITableViewCellSeparatorStyleNone;
            }
        } else {
            if (self.separatorStyle != self.eV_previousSeparatorStyle) {
                // we've seen an issue with the separator color not being correct when setting separator style during layoutSubviews
                // that's why we schedule the call on the next runloop cycle
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.separatorStyle = self.eV_previousSeparatorStyle;
                });
                
            }
        }
    }
    
    // show / hide empty view
    emptyView.hidden = !emptyViewShouldBeShown;
}


#pragma mark Swizzle methods

- (void)eV_reloadData;
{
    // this calls the original reloadData implementation
    [self eV_reloadData];
    
    [self eV_updateEmptyView];
}

- (void)eV_layoutSubviews;
{
    // this calls the original layoutSubviews implementation
    [self eV_layoutSubviews];
    
    [self eV_updateEmptyView];
}

@end

#pragma mark -

@implementation UITableView (EmptyViewPrivate)

@dynamic eV_previousSeparatorStyle;
- (UITableViewCellSeparatorStyle)eV_previousSeparatorStyle
{
    NSNumber *previousSeparatorStyle = objc_getAssociatedObject(self, &EmptyViewPreviousSeparatorStyleAssociatedKey);
    return previousSeparatorStyle ? [previousSeparatorStyle intValue] : self.separatorStyle;
}

- (void)setSqEV_previousSeparatorStyle:(UITableViewCellSeparatorStyle)value
{
    NSNumber *previousSeparatorStyle = [NSNumber numberWithInt:value];
    objc_setAssociatedObject(self, &EmptyViewPreviousSeparatorStyleAssociatedKey, previousSeparatorStyle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
