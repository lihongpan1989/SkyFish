//
//  KGFreshCatchCommentObject.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/22.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGFreshCatchCommentObject.h"
#import "KGFreshCatchChildObject.h"
@implementation KGFreshCatchCommentObject
+ (NSDictionary *)objectClassInArray
{
    return @{@"child":[KGFreshCatchChildObject class]};
}
@end
