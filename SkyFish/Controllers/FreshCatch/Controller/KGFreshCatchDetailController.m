//
//  KGFreshCatchDetailController.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/22.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGFreshCatchDetailController.h"
#import "KGFreshCatchCell.h"
#import "KGFreshCatchCellFrame.h"
#import "KGFreshCatchDetailZanView.h"
#import "KGFreshCatchUser.h"

#import "ReqestData.h"
@interface KGFreshCatchDetailController ()
@property (nonatomic, strong) NSMutableDictionary *bodyDic;
@end

@implementation KGFreshCatchDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"渔获详情";
    _bodyDic = [NSMutableDictionary dictionary];
    [self getData];
}

-(void)getData
{
    [_bodyDic setObject:@0 forKey:@"page"];
    [_bodyDic setObject:@10 forKey:@"count"];
    [_bodyDic setObject:@82 forKey:@"id"];
    [ReqestData requestInfomationWithURI:WEIBO_COMMENTLIST andParameters:@{@"id":[NSString stringWithFormat:@"%ld",(long)_status.status.id]} complete:^(NSDictionary *responseDic) {
        MyLog(@"%@",responseDic);
    } failed:^(NSError *error) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        // 创建cell
        KGFreshCatchCell *cell = [KGFreshCatchCell cellWithTableView:tableView];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;

        // 获取status模型
        KGFreshCatchCellFrame *statusF = _status;
        
        // 给cell传递模型
        cell.statusF = statusF;
        
        return cell;
    }else{
        static NSString *cellID = @"cellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.selectionStyle =UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
}
// 返回cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return _status.cellHeight;
    }
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 44;
    }else
        return 0;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        KGFreshCatchDetailZanView *zanView = [[KGFreshCatchDetailZanView alloc]init];
        
        zanView.frame = CGRectMake(0, 0, kSizeOfScreen.width, 44);
        zanView.status = _status;
        
        return zanView;
    }else
        return [[UIView alloc]init];
    
    
}
-(void)setStatus:(KGFreshCatchCellFrame *)status
{
    _status = status;
    [self.tableView reloadData];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
