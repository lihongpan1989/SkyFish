//
//  KGUserCenterController.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/18.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGUserCenterController.h"
#import "DEMONavigationController.h"
@interface KGUserCenterController ()

@end

@implementation KGUserCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"按钮_左侧菜单"] style:UIBarButtonItemStyleBordered target:(DEMONavigationController *)self.navigationController action:@selector(showMenu)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
