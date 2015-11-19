//
//  NSData+Tools.m
//  ismondApp
//
//  Created by 李大鹏 on 15/8/14.
//  Copyright (c) 2015年 ismond. All rights reserved.
//

#import "NSData+Tools.h"

@implementation NSData (Tools)

+ (NSArray *)decodeCSVData2JsonArrayWith:(NSData *)responseObject
{
    
    NSString *content = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    if (!content) return nil;
    NSMutableArray *objcRows = [NSMutableArray array];
    NSArray *rows = [content componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
    
    for (NSString *string in rows) {
        
        NSString *objcStr = [string stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        
        NSArray *objcCols = [objcStr componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
        [objcRows addObject:objcCols];
        
    }
    
    NSArray *dictTitles = objcRows[0];
    NSMutableArray *jsonArray = [NSMutableArray array];
    
    for (NSUInteger index = 1; index < objcRows.count; index ++) {
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        NSArray *row = objcRows[index];
        
        for (NSUInteger index = 0; index < dictTitles.count; index ++) {
            
            NSString *title = dictTitles[index];
            NSString *rowContent = row[index];
            [dict setObject:rowContent forKey:title];
        
        }
        [jsonArray addObject:dict];
        
    }
    
    return jsonArray;
    
}

@end
