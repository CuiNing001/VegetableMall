//
//  ClassifyGoodsListTableViewCell.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/20.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassGoodsListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClassifyGoodsListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *coverPicImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *packPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *uintPriceLabel;

- (void)setCellDataWithModel:(ClassGoodsListModel *)model;

@end

NS_ASSUME_NONNULL_END
