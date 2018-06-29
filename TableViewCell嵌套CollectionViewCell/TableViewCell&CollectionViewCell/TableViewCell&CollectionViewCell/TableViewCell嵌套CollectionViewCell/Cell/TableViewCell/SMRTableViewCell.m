//
//  SMRTableViewCell.m
//  TableViewCell&CollectionViewCell
//
//  Created by 范智超 on 2018/6/28.
//  Copyright © 2018年 范智超. All rights reserved.
//

#import "SMRTableViewCell.h"
#import "SMRCollectionViewCell.h"

NSString *const Cell_Id_SmrTableViewCell = @"SMRTableViewCell";
NSString *const Nib_Id_SmrTableViewNib = @"SMRTableViewCell";

@interface SMRTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) UICollectionViewFlowLayout *layout; /** < layout布局 > */


@property (nonatomic, strong) NSMutableArray *datas; /** < 数据源 > */


@end

@implementation SMRTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUI];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setUI
{
//    注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:Nib_Id_SmrCollectionViewCell bundle:nil] forCellWithReuseIdentifier:Cell_Id_SmrCollectionViewCell];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.collectionViewLayout = self.layout; //layout布局
    self.collectionView.showsHorizontalScrollIndicator = NO; //滚动条默认是开启的
    self.iconImage.backgroundColor = [UIColor grayColor];
    
}


- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}


- (void)setModelOne:(SMRTableViewModel *)modelOne
{
    _modelOne = modelOne;
    self.titleLabel.text = modelOne.index;
}

- (NSMutableArray *)datas
{
    if (!_datas) {
        _datas = [NSMutableArray array];
        for (NSInteger i = 0; i < 20; i++) {
            SMRCollectionViewModel *model = [[SMRCollectionViewModel alloc] init];
            model.imageName = @"撕麦耳";
            [_datas addObject:model];
        }
    }
    return _datas;
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





#pragma mark - layout布局
- (UICollectionViewFlowLayout *)layout
{
    if (_layout == nil) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = 8;
        _layout.minimumInteritemSpacing = 8;
        _layout.itemSize = CGSizeMake(100, 25);
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; // 水平移动
    }
    return _layout;
}





@end
