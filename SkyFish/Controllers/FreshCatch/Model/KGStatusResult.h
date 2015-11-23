//
//  KGStatusResult.h
//  SkyFish
//
//  Created by 李洪攀 on 15/11/21.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@interface KGStatusResult : NSObject<MJKeyValue>

/**
 *  用户的信息数组（CZStatus）
 */
@property (nonatomic, strong) NSArray *data;

@property (nonatomic, strong) NSString *info;
@property (nonatomic, assign) NSInteger status;
@end
