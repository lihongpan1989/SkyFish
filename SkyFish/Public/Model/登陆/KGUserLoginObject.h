//
//  KGUserLoginObject.h
//  SkyFish
//
//  Created by 李洪攀 on 15/11/22.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KGUserLoginObject : NSObject
//用户id
@property (nonatomic, assign) NSInteger id;
//用户昵称
@property (nonatomic, strong) NSString *name;
//用户头像
@property (nonatomic, strong) NSString *avatar;
//背景图片
@property (nonatomic, strong) NSString *bg;
//特长
@property (nonatomic, strong) NSString *skill;
//年龄
@property (nonatomic, strong) NSString *age;
//地址
@property (nonatomic, strong) NSString *address;
//微博数
@property (nonatomic, strong) NSString *blogCount;
//我关注的数量
@property (nonatomic, strong) NSString *cared;
//关注我的数量
@property (nonatomic, strong) NSString *fans;

@property (nonatomic, strong) NSArray *seed;
@end
