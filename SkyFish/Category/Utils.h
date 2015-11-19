//
//  Utils.h
//  SkyFish
//
//  Created by 李洪攀 on 15/11/18.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject
//判断手机和密码是否正确
+(void)checkPhoneNub:(NSString *)phoneNub andPassword:(NSString *)password complete:(void (^)(BOOL isSuccess))completeBlock error:(void (^)(NSString *errorMsg))errorBlock;

//判断手机号码
+(BOOL)checkPhoneNub:(NSString *)phoneNub;
@end
