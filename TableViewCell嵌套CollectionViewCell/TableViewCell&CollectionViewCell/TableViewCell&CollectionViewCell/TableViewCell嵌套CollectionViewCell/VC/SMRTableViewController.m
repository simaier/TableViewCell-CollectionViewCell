//
//  SMRTableViewController.m
//  TableViewCell&CollectionViewCell
//
//  Created by 范智超 on 2018/6/28.
//  Copyright © 2018年 范智超. All rights reserved.
//

#import "SMRTableViewController.h"
#import "SMRTableViewCell.h"
#import "SMRDetailVC.h"

@interface SMRTableViewController ()


@property (nonatomic, strong) NSMutableArray *datas; /** < 数据源 > */

@end

@implementation SMRTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    
    self.tableView.backgroundColor = [UIColor redColor];
}

- (NSMutableArray *)datas
{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

- (void)setUI
{
    for (NSInteger i = 0; i < 10; i++) {
        SMRTableViewModel *model = [[SMRTableViewModel alloc] init];
        model.index = [NSString stringWithFormat:@"%ld",i];
        [self.datas addObject:model];
    }
    
    
    [self.tableView registerClass:[SMRTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:Nib_Id_SmrTableViewNib bundle:nil] forCellReuseIdentifier:Cell_Id_SmrTableViewCell];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.datas.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SMRTableViewModel *model = self.datas[indexPath.row];
    
    SMRTableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:Cell_Id_SmrTableViewCell];
    
    if (!cell) {
        cell = [[SMRTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell_Id_SmrTableViewCell];
    }
    
    cell.modelOne = model;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SMRDetailVC *detailVC = [[SMRDetailVC alloc] init];
    detailVC.model = self.datas[indexPath.row];
    
    [self presentViewController:detailVC animated:YES completion:nil];
    
}



@end
