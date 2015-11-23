//
//  KGFreshCatchCellFrame.h
//  SkyFish
//
//  Created by 李洪攀 on 15/11/21.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KGFreshCatchUser;
@interface KGFreshCatchCellFrame : NSObject
/**
 *  微博数据
 */
@property (nonatomic, strong) KGFreshCatchUser *status;

// 顶部视图frame
@property (nonatomic, assign) CGRect originalViewFrame;

/**   ******顶部视图子空间控件frame**** */
// 头像Frame
@property (nonatomic, assign) CGRect originalIconFrame;

// 昵称Frame
@property (nonatomic, assign) CGRect originalNameFrame;

// vipFrame
@property (nonatomic, assign) CGRect originalVipFrame;

// 时间Frame
@property (nonatomic, assign) CGRect originalTimeFrame;

// 来源Frame
@property (nonatomic, assign) CGRect originalSourceFrame;

// 正文Frame
@property (nonatomic, assign) CGRect originalTextFrame;

// 配图Frame
@property (nonatomic, assign) CGRect originalPhotosFrame;


// 工具条frame
@property (nonatomic, assign) CGRect toolBarFrame;



// cell的高度
@property (nonatomic, assign) CGFloat cellHeight;
@end
