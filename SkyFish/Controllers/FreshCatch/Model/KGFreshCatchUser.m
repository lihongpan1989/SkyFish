//
//  KGFreshCatchUser.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/21.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGFreshCatchUser.h"
#import "KGFreshCatchImages.h"
#import "KGFreshCatchPraiseMember.h"
#import "KGFreshCatchCommentObject.h"
@implementation KGFreshCatchUser
+ (NSDictionary *)objectClassInArray
{
    
    return @{@"praiseMember":[KGFreshCatchPraiseMember class],@"comment":[KGFreshCatchCommentObject class]};
}
@end
