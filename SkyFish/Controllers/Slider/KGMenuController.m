//
//  KGMenuController.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/18.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGMenuController.h"
#import "DEMONavigationController.h"
#import "KGFishingPointController.h"//钓点
#import "KGSettingController.h"//设置
#import "KGUserCenterController.h"//个人中心
#import "KGMessageController.h"//消息
#import "KGFreshCatchController.h"//渔获
#import "UIViewController+REFrostedViewController.h"
#import "KGMenuTableViewCell.h"
#import "KGMenuHeadBtn.h"//左侧顶部按钮
#import "KGLoginController.h"//登陆
@interface KGMenuController ()
{

}
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imgArray;
@property (nonatomic, strong) KGMenuHeadBtn *headBtn;
@end

@implementation KGMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}
-(void)buildUI
{
    self.titleArray = @[@[@"渔获",@"钓点",@"消息",@"个人中心"],@[@"设置",@"注销"]];
    self.imgArray = @[@[@"tab钓点-未选中",@"tab热闹-未选中",@"tab消息-未选中",@"tab个人-未选中"],@[@"tab设置-未选中",@"tab注销-未选中"]];
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"KGMenuTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    self.headBtn = [[KGMenuHeadBtn alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 184.0f)];
    [self.headBtn addTarget:self action:@selector(headClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headBtn setTitle:@"Roman Efimov" forState:UIControlStateNormal];
    [self.headBtn setImage:[UIImage imageNamed:@"avatar.jpg"] forState:UIControlStateNormal];
    self.tableView.tableHeaderView = self.headBtn;
    }
-(void)headClick:(KGMenuHeadBtn*)sender
{
    MyLog(@"%s",__func__);
    KGLoginController *loginVC = [[KGLoginController alloc] init];
    DEMONavigationController *navigationController = [[DEMONavigationController alloc] initWithRootViewController:loginVC];
//    self.frostedViewController.contentViewController = navigationController;
    [self presentViewController:navigationController animated:YES completion:nil];
}
#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return nil;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 10)];
    view.backgroundColor = [UIColor colorWithRed:167/255.0f green:167/255.0f blue:167/255.0f alpha:0.6f];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return 0;
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *turnVC;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {//渔获
            KGFreshCatchController *homeViewController = [[KGFreshCatchController alloc] init];
            turnVC = homeViewController;
        }else if (indexPath.row == 1){//钓点
            KGFishingPointController *homeViewController = [[KGFishingPointController alloc] init];
            turnVC = homeViewController;
        }else if (indexPath.row == 2){//消息
            KGMessageController *homeViewController = [[KGMessageController alloc] init];
            turnVC = homeViewController;
        }else if (indexPath.row == 3){//个人中心
            KGUserCenterController *homeViewController = [[KGUserCenterController alloc] init];
            turnVC = homeViewController;
        }
        DEMONavigationController *navigationController = [[DEMONavigationController alloc] initWithRootViewController:turnVC];
        self.frostedViewController.contentViewController = navigationController;
        
    } else {
        if (indexPath.row == 0) {//设置
            KGSettingController *homeViewController = [[KGSettingController alloc] init];
            DEMONavigationController *navigationController = [[DEMONavigationController alloc] initWithRootViewController:homeViewController];
            self.frostedViewController.contentViewController = navigationController;
        }else if (indexPath.row == 1){//注销登录
            [[[UIAlertView alloc]initWithTitle:@"提示" message:@"您确定要退出登录吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"注销", nil] show];
        }
    }
    
    [self.frostedViewController hideMenuViewController];
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return [_titleArray[sectionIndex] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    KGMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[KGMenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.nameLabel.text = _titleArray[indexPath.section][indexPath.row];
    [cell.iconImg setImage:[UIImage imageNamed:_imgArray[indexPath.section][indexPath.row]]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    }
    
    return cell;
}
@end
