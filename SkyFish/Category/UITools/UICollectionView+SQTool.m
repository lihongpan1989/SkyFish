//
//  UICollectionView+SQTool.m
//  SQToolsKit
//
//  Created by 李大鹏 on 15/4/25.
//  Copyright (c) 2015年 lidapeng. All rights reserved.
//

#import "UICollectionView+SQTool.h"

#import <QuartzCore/QuartzCore.h>
#import "Aspects.h"
#import "UICollectionView+SQTool.h"
#import "ObjcAssociatedObjectHelpers.h"

@interface UICollectionView (EmptyStatePrivate)
@property (nonatomic, strong) id <AspectToken> __empty_swizzleToken;
- (void) __empty_layoutSubviews;
- (void) __empty_layoutAddViewItems:(NSUInteger) items
                            section:(NSUInteger) sections;
- (void) __empty_layoutRemoveView;
- (NSUInteger) __empty_numberOfSections;
- (NSUInteger) __empty_totalNumberOfItems;
@end

@implementation UICollectionView (EmptyState)

SYNTHESIZE_ASC_OBJ_ASSIGN(emptyState_delegate,
                          setEmptyState_delegate)
SYNTHESIZE_ASC_PRIMITIVE(emptyState_showAnimationDuration,
                         setEmptyState_showAnimationDuration,
                         NSTimeInterval)
SYNTHESIZE_ASC_PRIMITIVE(emptyState_hideAnimationDuration,
                         setEmptyState_hideAnimationDuration,
                         NSTimeInterval)
SYNTHESIZE_ASC_PRIMITIVE(emptyState_showDelay,
                         setEmptyState_showDelay,
                         NSTimeInterval)
SYNTHESIZE_ASC_PRIMITIVE(emptyState_hideDelay,
                         setEmptyState_hideDelay,
                         NSTimeInterval)
SYNTHESIZE_ASC_OBJ(__empty_swizzleToken, set__empty_swizzleToken)
SYNTHESIZE_ASC_PRIMITIVE_BLOCK(emptyState_shouldRespectSectionHeader,
                               setEmptyState_shouldRespectSectionHeader,
                               BOOL,
                               ^(BOOL v) { return v; },
                               ^(BOOL v) { return v; })
SYNTHESIZE_ASC_OBJ_BLOCK(emptyState_view,
                         setEmptyState_view,
                         ^(UIView *view) { return view; },
                         ^(UIView *view)
{
    if (view && !self.__empty_swizzleToken) {
        NSError *e = nil;
        self.__empty_swizzleToken = [self aspect_hookSelector:@selector(layoutSubviews)
                                                  withOptions:AspectPositionAfter
                                                   usingBlock:^
                                     {
                                         [self __empty_layoutSubviews];
                                     } error:&e];
        NSAssert(!e, e.localizedDescription);
    }
    
    else if (!view && self.__empty_swizzleToken) {
        [self.__empty_swizzleToken remove];
        self.__empty_swizzleToken = nil;
    }
    
    [self.emptyState_view removeFromSuperview];
    
    return view;
});

- (void) __empty_layoutSubviews {
    [self __empty_layoutHeader];
    
    BOOL animating = [self.emptyState_view.layer.animationKeys containsObject:@"opacity"];
    
    NSUInteger totalItems = self.__empty_totalNumberOfItems;
    if (totalItems) {
        if (self.emptyState_view.superview && !animating) {
            [self __empty_layoutRemoveView];
        }
    } else {
        if (self.emptyState_view && self.emptyState_view.superview != self && !animating) {
            [self __empty_layoutAddViewItems:totalItems section:self.__empty_numberOfSections];
        }
    }
}

- (NSUInteger)__empty_numberOfSections {
    if ([self.dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)]) {
        return [self.dataSource numberOfSectionsInCollectionView:self];
    }
    return 1;
}

- (NSUInteger)__empty_totalNumberOfItems {
    NSUInteger totalItems = 0;
    NSUInteger numberOfSections = self.__empty_numberOfSections;
    
    for (NSUInteger section = 0; section < numberOfSections; ++section) {
        totalItems += [self.dataSource collectionView:self numberOfItemsInSection:section];
    }
    
    return totalItems;
}

- (void) __empty_layoutHeader {
    CGRect bounds = self.bounds;
    if (self.emptyState_view && self.emptyState_shouldRespectSectionHeader) {
        UICollectionViewFlowLayout *layout = (id) self.collectionViewLayout;
        NSAssert2([layout isKindOfClass:[UICollectionViewFlowLayout class]],
                  @"Only compatible with %@ when emptyState_shouldRespectSectionHeader = YES." \
                  " Cannot be used with %@",
                  NSStringFromClass([UICollectionViewFlowLayout class]),
                  NSStringFromClass([self.collectionViewLayout class]));
        
        if (self.__empty_numberOfSections &&
            [self.dataSource
             respondsToSelector:@selector(collectionView:viewForSupplementaryElementOfKind:atIndexPath:)])
        {
            CGSize headerSize = layout.headerReferenceSize;
            
            if ([self.delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForHeaderInSection:)]) {
                headerSize = [(id <UICollectionViewDelegateFlowLayout>) self.delegate
                              collectionView:self
                              layout:layout
                              referenceSizeForHeaderInSection:0];
            }
            
            CGRect slice;
            CGRectDivide(bounds, &slice, &bounds, headerSize.height, CGRectMinYEdge);
        }
    }
    CGRect rect = UIEdgeInsetsInsetRect(bounds, self.contentInset);
    if ([self.emptyState_delegate respondsToSelector:
         @selector(collectionView:willSetFrame:forEmptyStateOverlayView:)])
    {
        rect = [self.emptyState_delegate collectionView:self
                                           willSetFrame:rect
                               forEmptyStateOverlayView:self.emptyState_view];
    }
    
    self.emptyState_view.frame = rect;
}

- (void) __empty_layoutAddViewItems:(NSUInteger) totalItems
                            section:(NSUInteger) numberOfSections
{
    // add view
    if (self.emptyState_view.superview != self) {
        // not visible, add
        self.emptyState_view.alpha = 0.0;
        [self addSubview:self.emptyState_view];
        
        [UIView animateWithDuration:self.emptyState_showAnimationDuration
                              delay:self.emptyState_showDelay
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^
         {
             // pre-display
             if ([self.emptyState_delegate
                  respondsToSelector:@selector(collectionView:willAddEmptyStateOverlayView:animated:)])
             {
                 [self.emptyState_delegate collectionView:self
                             willAddEmptyStateOverlayView:self.emptyState_view
                                                 animated:!!self.emptyState_showAnimationDuration];
             }
             
             self.emptyState_view.alpha = 1.0;
         } completion:^(BOOL finished) {
             if ([self.emptyState_delegate
                  respondsToSelector:@selector(collectionView:didAddEmptyStateOverlayView:)])
             {
                 [self.emptyState_delegate collectionView:self
                              didAddEmptyStateOverlayView:self.emptyState_view];
             }
         }];
    }
}

- (void)__empty_layoutRemoveView {
    [UIView animateWithDuration:self.emptyState_hideAnimationDuration
                          delay:self.emptyState_hideDelay
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^
     {
         if ([self.emptyState_delegate
              respondsToSelector:@selector(collectionView:willRemoveEmptyStateOverlayView:animated:)])
         {
             [self.emptyState_delegate collectionView:self
                      willRemoveEmptyStateOverlayView:self.emptyState_view
                                             animated:!!self.emptyState_hideAnimationDuration];
         }
         
         self.emptyState_view.alpha = 0.0;
     } completion:^(BOOL finished) {
         [self.emptyState_view removeFromSuperview];
         if ([self.emptyState_delegate respondsToSelector:@selector(collectionView:didRemoveEmptyStateOverlayView:)]) {
             [self.emptyState_delegate collectionView:self
                       didRemoveEmptyStateOverlayView:self.emptyState_view];
         }
     }];
}

#pragma mark -

- (UIImageView*) setEmptyStateImageViewWithImage:(UIImage*) image {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeCenter;
    self.emptyState_view = imageView;
    return imageView;
}

@end

@implementation UICollectionView (SQTool)

@end
