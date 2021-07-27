//
//  TZMainViewController.m
//  Rabbit
//
//  Created by Rabbit on 2018/8/28.
//  Copyright © 2018年 Rabbit. All rights reserved.
//

#import "TZMainViewController.h"
#import "Style309TableViewCell.h"
@interface TZMainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation TZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self.view addSubview: self.tableView];
    
}
#pragma mark -- TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 124;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Style309TableViewCell *cell = [Style309TableViewCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.itemModel = self.dataArr[indexPath.row];
//    cell.dict = self.dataArr[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if ([SVProgressHUD isVisible]) {
//        return;
//    }
//    LNSCItemModel *model = self.dataArr[indexPath.row];
//    LNSCCircleMainController *circleVC = [[LNSCCircleMainController alloc] init];
//    circleVC.source = self.source;
//    circleVC.itemModel = model;
//    circleVC.sportsCircleId = model.sportsCircleId;
//    circleVC.activityModel = self.activityModel;
//    circleVC.fromEntry = YES;
//    [self.navigationController pushViewController:circleVC animated:YES];

}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.scrollEnabled = NO;
//        [_tableView registerClass:[LNSCEntryCell class] forCellReuseIdentifier:@"LNSCEntryCell"];
    }
    return _tableView;
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
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
