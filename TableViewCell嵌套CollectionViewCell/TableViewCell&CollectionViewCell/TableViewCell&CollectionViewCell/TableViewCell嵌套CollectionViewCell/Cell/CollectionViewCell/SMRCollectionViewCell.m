//
//  SMRCollectionViewCell.m
//  TableViewCell&CollectionViewCell
//
//  Created by 范智超 on 2018/6/28.
//  Copyright © 2018年 范智超. All rights reserved.
//

#import "SMRCollectionViewCell.h"

NSString *const Cell_Id_SmrCollectionViewCell = @"SMRCollectionViewCell";
NSString *const Nib_Id_SmrCollectionViewCell = @"SMRCollectionViewCell";

@interface SMRCollectionViewCell()

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation SMRCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = 4;
}


- (void)setModel:(collectionViewModel *)model
{
    _model = model;
    self.titleLabel.text = @"撕麦耳";
    self.backgroundColor = [UIColor yellowColor];
    
}

@end
