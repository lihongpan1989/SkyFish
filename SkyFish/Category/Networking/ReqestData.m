//
//  ReqestData.m
//  GoFishing
//
//  Created by darkclouds on 15/11/16.
//  Copyright © 2015年 darkclouds. All rights reserved.
//

#import "ReqestData.h"

@implementation ReqestData
+(void)requestInfomationWithURI:(NSString *)URI andParameters:(id)theParameters complete:(void (^)(NSDictionary *))complete failed:(void (^)(NSError *))failed{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *URL = [NSString stringWithFormat:@"%@%@",SERVER_URL,URI];
    [manager POST:URL parameters:theParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(complete){
            complete(responseObject);
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end
