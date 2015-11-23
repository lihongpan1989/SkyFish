//
//  KGFreshCatchSquareController.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/19.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGFreshCatchSquareController.h"
#import "ReqestData.h"
#import "KGStatusResult.h"
#import "KGFreshCatchUser.h"
#import "MJExtension.h"
#import "KGFreshCatchCell.h"
#import "KGFreshCatchCellFrame.h"
#import "KGFreshCatchDetailController.h"

@interface KGFreshCatchSquareController ()
{
    NSMutableArray *_blogs;
}
@end

@implementation KGFreshCatchSquareController

- (void)viewDidLoad {
    [super viewDidLoad];
    _blogs = [NSMutableArray array];
    NSDictionary *parameters = @{@"page":@"0",@"count":@"20"};
    [ReqestData requestInfomationWithURI: WEIBO_GETLISTGROUND andParameters:parameters complete:^(NSDictionary *responseDic) {
        KGStatusResult *result = [KGStatusResult mj_objectWithKeyValues:responseDic];
        for (KGFreshCatchUser *status in result.data) {
            KGFreshCatchCellFrame *statusF = [[KGFreshCatchCellFrame alloc]init];
            statusF.status = status;
            [_blogs addObject:statusF];
        }
        
        [self.tableView reloadData];
    }failed:^(NSError *error) {
                                      
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _blogs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建cell
    KGFreshCatchCell *cell = [KGFreshCatchCell cellWithTableView:tableView];
    
    
    // 获取status模型
    KGFreshCatchCellFrame *statusF = _blogs[indexPath.row];
    
    // 给cell传递模型
    cell.statusF = statusF;
    
    return cell;
}
// 返回cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取status模型
    KGFreshCatchCellFrame *statusF = _blogs[indexPath.row];
    
    return statusF.cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    KGFreshCatchCellFrame *statusF = _blogs[indexPath.row];
    KGFreshCatchDetailController *detailVC = [[KGFreshCatchDetailController alloc]init];
    detailVC.status = statusF;
    [self.navigationController pushViewController:detailVC animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
