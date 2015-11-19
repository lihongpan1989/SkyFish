//
//  KGSettingController.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/19.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGSettingController.h"
#import "DEMONavigationController.h"
#import "KGMenuTableViewCell.h"

#import "KGModifyController.h" //修改密码
#import "KGBindingPhoneController.h" //手机绑定修改
#import "KGMessageSettingController.h" //消息设置
#import "KGUserFeedbackController.h" //用户反馈
#import "KGAboutSkyFishController.h" //关于空钩
@interface KGSettingController ()
{
    NSArray *_imgArray;//图片数据
    
    NSArray *_titleArray;//标题数据
}
@end

@implementation KGSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    _titleArray = @[@[@"修改密码",@"手机绑定修改",@"消息设置"],@[@"用户反馈",@"关于空钩"]];
    _imgArray = @[@[@"密码修改",@"手机绑定修改",@"评论"],@[@"赞",@"关于空钩"]];
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"KGMenuTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"按钮_左侧菜单"] style:UIBarButtonItemStyleBordered target:(DEMONavigationController *)self.navigationController action:@selector(showMenu)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 10)];
    view.backgroundColor = [UIColor colorWithRed:167/255.0f green:167/255.0f blue:167/255.0f alpha:0.6f];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *turnVC;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {//渔获
            KGModifyController *homeViewController = [[KGModifyController alloc] init];
            turnVC = homeViewController;
        }else if (indexPath.row == 1){//钓点
            KGBindingPhoneController *homeViewController = [[KGBindingPhoneController alloc] init];
            turnVC = homeViewController;
        }else if (indexPath.row == 2){//消息
            KGMessageSettingController *homeViewController = [[KGMessageSettingController alloc] init];
            turnVC = homeViewController;
        }
        [self.navigationController pushViewController:turnVC animated:YES];
        
    } else {
        if (indexPath.row == 0) {//渔获
            KGUserFeedbackController *homeViewController = [[KGUserFeedbackController alloc] init];
            turnVC = homeViewController;
        }else if (indexPath.row == 1){//钓点
            KGAboutSkyFishController *homeViewController = [[KGAboutSkyFishController alloc] init];
            turnVC = homeViewController;
        }else if (indexPath.row == 2){//消息
            KGMessageSettingController *homeViewController = [[KGMessageSettingController alloc] init];
            turnVC = homeViewController;
        }
        [self.navigationController pushViewController:turnVC animated:YES];
    }
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
    static NSString *cellIdentifier = @"cell";
    
    KGMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[KGMenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.nameLabel.text = _titleArray[indexPath.section][indexPath.row];
    [cell.iconImg setImage:[UIImage imageNamed:_imgArray[indexPath.section][indexPath.row]]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    
    return cell;
}
@end
