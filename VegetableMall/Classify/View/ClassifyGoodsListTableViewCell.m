//
//  ClassifyGoodsListTableViewCell.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/20.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "ClassifyGoodsListTableViewCell.h"

@implementation ClassifyGoodsListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCellDataWithModel:(ClassGoodsListModel *)model
{
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.coverPic]];
    [self.coverPicImageView sd_setImageWithURL:imageUrl];
    self.nameLabel.text = [NSString stringWithFormat:@"%@",model.name];
    self.packPriceLabel.text = [NSString stringWithFormat:@"%.2f元/份",model.packPrice.floatValue];
    self.uintPriceLabel.text = [NSString stringWithFormat:@"%.2f元/%@",model.unitPrice.floatValue,model.unit];
}

- (IBAction)addAction:(UIButton *)sender
{
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
