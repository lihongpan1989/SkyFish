//
//  KGStatusResult.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/21.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGStatusResult.h"
#import "KGFreshCatchUser.h"
@implementation KGStatusResult

// 告诉MJ框架，数组里的字典转换成哪个模型
+ (NSDictionary *)objectClassInArray
{
    return @{@"data":[KGFreshCatchUser class]};
}

@end
