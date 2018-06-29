//
//  SMRCollectionViewCell.h
//  TableViewCell&CollectionViewCell
//
//  Created by 范智超 on 2018/6/28.
//  Copyright © 2018年 范智超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "collectionViewModel.h"

UIKIT_EXTERN NSString *const Cell_Id_SmrCollectionViewCell;
UIKIT_EXTERN NSString *const Nib_Id_SmrCollectionViewCell;

@interface SMRCollectionViewCell : UICollectionViewCell


@property (nonatomic, strong) collectionViewModel *model; /** < 模型 > */

@end
