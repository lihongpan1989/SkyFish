//
//  Utils.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/18.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+(void)checkPhoneNub:(NSString *)phoneNub andPassword:(NSString *)password complete:(void (^)(BOOL isSuccess))completeBlock error:(void (^)(NSString *errorMsg))errorBlock
{
    if (![phoneNub isValid]) {
        if (errorBlock) {
            errorBlock(@"手机号码不能为空");
        }
        return;
    }
    if (![password isValid]) {
        if (errorBlock) {
            errorBlock(@"密码不能为空");
        }
         return;
    }
    if (![phoneNub isVAlidPhoneNumber]) {
        if (errorBlock) {
            errorBlock(@"手机号码不能不正确");
        }
         return;
    }
    if (!(password.length>5 && password.length<17)) {
        if (errorBlock) {
            errorBlock(@"密码长度必须为6-16位字母加数字");
        }
        return;
    }
    
    if (completeBlock) {
        completeBlock(YES);
    }
    
}

+(BOOL)checkPhoneNub:(NSString *)phoneNub
{
    if (![phoneNub isValid] || ![phoneNub isVAlidPhoneNumber]) {
        //(@"手机号码不能为空");
        return NO;
    }
    return YES;
}

@end
