//
//  KGFreshCatchController.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/19.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGFreshCatchController.h"
#import "DEMONavigationController.h"
#import "KGFreshCatchSquareController.h"//渔获广场
#import "KGFreshCatchNearbyController.h"//附近渔获
#import "KGFreshCatchFriendCircleController.h"//朋友圈
@interface KGFreshCatchController ()

@end

@implementation KGFreshCatchController
//重载init方法
- (instancetype)init
{
    if (self = [super initWithTagViewHeight:49])
    {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"渔获";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"按钮_左侧菜单"] style:UIBarButtonItemStyleBordered target:(DEMONavigationController *)self.navigationController action:@selector(showMenu)];
    
    //设置自定义属性
    self.tagItemSize = CGSizeMake(kSizeOfScreen.width/3, 49);
    
    self.backgroundColor = KMainColor;
    
    NSArray *titleArray = @[
                            @"渔获广场",
                            @"附近渔获",
                            @"朋友圈",
                            ];
    
    NSArray *classNames = @[
                            [KGFreshCatchSquareController class],
                            [KGFreshCatchNearbyController class],
                            [KGFreshCatchFriendCircleController class]
                            ];
    
    NSArray *params = @[
                        @"Square",
                        @"Nearby",
                        @"FriendCircle"
                        ];
    
    [self reloadDataWith:titleArray andSubViewdisplayClasses:classNames withParams:params];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
