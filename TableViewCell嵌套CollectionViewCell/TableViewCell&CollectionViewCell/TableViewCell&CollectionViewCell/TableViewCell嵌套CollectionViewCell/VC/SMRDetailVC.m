//
//  SMRDetailVC.m
//  TableViewCell&CollectionViewCell
//
//  Created by 范智超 on 2018/6/29.
//  Copyright © 2018年 范智超. All rights reserved.
//

#import "SMRDetailVC.h"
#import "SMRCollectionViewCell.h"

@interface SMRDetailVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionHeightLayout;

@property (nonatomic, strong) UICollectionViewFlowLayout *layout; /** < layout布局 > */


@property (strong, nonatomic) NSMutableArray *datas; /** < 数据源 > */

@end

@implementation SMRDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}

- (void)setUI
{

    
//    注册CollectionViewCell
    [self.collectionView registerNib:[UINib nibWithNibName:Nib_Id_SmrCollectionViewCell bundle:nil] forCellWithReuseIdentifier:Cell_Id_SmrCollectionViewCell];
    self.collectionView.collectionViewLayout = self.layout; // layout布局
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    

    if (self.datas.count <= 3) {
        self.collectionHeightLayout.constant = 45;
    }
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SMRCollectionViewCell *cell = (SMRCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:Cell_Id_SmrCollectionViewCell forIndexPath:indexPath];
    cell.model = self.datas[indexPath.row];
    return cell;
}

- (NSMutableArray *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
        for (NSInteger i = 0; i < 10; i++) {
            SMRCollectionViewModel *model = [[SMRCollectionViewModel alloc] init];
            [_datas addObject:model];
        }
    }
    return _datas;
}

#pragma mark - layout布局
- (UICollectionViewFlowLayout *)layout
{
    if (_layout == nil) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
        _layout.minimumLineSpacing = 10;
        _layout.minimumInteritemSpacing = 5;
        _layout.itemSize = CGSizeMake(69, 25);
    }
    return _layout;
}

@end
