//
//  KGFreshCatchCommentObject.h
//  SkyFish
//
//  Created by 李洪攀 on 15/11/22.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@interface KGFreshCatchCommentObject : NSObject

@property (nonatomic, assign)NSInteger id;
@property (nonatomic, assign)NSInteger original;
@property (nonatomic, assign)NSInteger authorId;
@property (nonatomic, strong) NSString *authorAvatar;
@property (nonatomic, assign)NSInteger time;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSArray *child;
@end
