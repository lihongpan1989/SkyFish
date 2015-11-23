//
//  KGFreshCatchUser.h
//  SkyFish
//
//  Created by 李洪攀 on 15/11/21.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MJExtension.h"
@interface KGFreshCatchUser : NSObject<MJKeyValue>
@property(nonatomic,assign) NSInteger id;//
@property(nonatomic,assign) NSInteger authorId;//
@property(nonatomic,strong) NSString *address; //
@property(nonatomic,strong) NSString *content;//
@property(nonatomic,strong) NSArray *images;//
@property(nonatomic,assign) NSInteger praiseCount;//
@property(nonatomic,assign) NSInteger commentCount;//
@property(nonatomic,strong) NSString *time;//
@property(nonatomic,assign) NSInteger visitCount;//
@property(nonatomic,strong) NSString *authorAvatar;//用户头像
@property(nonatomic,strong) NSString *authorName;//
@property(nonatomic,assign) NSInteger *praiseStatus;
@property(nonatomic,strong) NSArray *praiseMember;//
@property(nonatomic,strong) NSString *lat;//
@property(nonatomic,strong) NSString *lng;//
@property(nonatomic,strong) NSArray *comment;
@end
