//
//  NSData+Tools.h
//  ismondApp
//
//  Created by 李大鹏 on 15/8/14.
//  Copyright (c) 2015年 ismond. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Tools)

+ (NSArray *)decodeCSVData2JsonArrayWith:(NSData *)responseObject;

@end
