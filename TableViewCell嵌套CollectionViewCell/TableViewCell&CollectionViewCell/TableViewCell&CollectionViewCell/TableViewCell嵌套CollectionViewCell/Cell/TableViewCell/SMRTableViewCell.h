//
//  SMRTableViewCell.h
//  TableViewCell&CollectionViewCell
//
//  Created by 范智超 on 2018/6/28.
//  Copyright © 2018年 范智超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMRCollectionViewModel.h"
#import "SMRTableViewModel.h"

UIKIT_EXTERN NSString *const Cell_Id_SmrTableViewCell;
UIKIT_EXTERN NSString *const Nib_Id_SmrTableViewNib;

@interface SMRTableViewCell : UITableViewCell


@property (nonatomic, strong) SMRCollectionViewModel *model; /** < 模型 > */

@property (nonatomic, strong) SMRTableViewModel *modelOne; /** < <#注释#> > */

@end
