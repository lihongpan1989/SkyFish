//
//  NSString+Validation.h
//  TouWroldApp
//
//  Created by 李大鹏 on 15/6/17.
//  Copyright (c) 2015年 com.touworld.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tools)

-(BOOL)isValid;

- (NSString *)moneyString;
- (NSString *)removeMoneyFormat;

- (NSString *)addString:(NSString *)string;

- (BOOL)isVAlidPhoneNumber;

+ (NSString *)intervalSinceNow:(NSString*) theDate;

+ (NSString *)dateStringWithInterval:(NSString *)interval;

@end
