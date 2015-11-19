//
//  UICollectionView+SQTool.h
//  SQToolsKit
//
//  Created by 李大鹏 on 15/4/25.
//  Copyright (c) 2015年 lidapeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UICollectionViewEmptyStateDelegate;

@interface UICollectionView (EmptyState)

@property (nonatomic, strong) UIView *emptyState_view;

- (UIImageView*) setEmptyStateImageViewWithImage:(UIImage*) image;

@property (nonatomic, assign) BOOL emptyState_shouldRespectSectionHeader;

@property (nonatomic, assign) NSTimeInterval emptyState_showAnimationDuration;

@property (nonatomic, assign) NSTimeInterval emptyState_hideAnimationDuration;

@property (nonatomic, assign) NSTimeInterval emptyState_showDelay;

@property (nonatomic, assign) NSTimeInterval emptyState_hideDelay;

@property (nonatomic, unsafe_unretained) id <UICollectionViewEmptyStateDelegate> emptyState_delegate;

@end

#pragma mark -

@protocol UICollectionViewEmptyStateDelegate <NSObject>
@optional

- (void) collectionView:(UICollectionView*) collectionView
  willAddEmptyStateOverlayView:(UIView*) view
                      animated:(BOOL) animated;

- (void) collectionView:(UICollectionView*) collectionView
 willRemoveEmptyStateOverlayView:(UIView*) view
                        animated:(BOOL) animated;

- (void) collectionView:(UICollectionView*) collectionView
   didAddEmptyStateOverlayView:(UIView*) view;


- (void) collectionView:(UICollectionView*) collectionView
  didRemoveEmptyStateOverlayView:(UIView*) view;

- (CGRect) collectionView:(UICollectionView*) collectionView
             willSetFrame:(CGRect) proposed
 forEmptyStateOverlayView:(UIView*) view;
@end

@interface UICollectionView (SQTool)

@end
