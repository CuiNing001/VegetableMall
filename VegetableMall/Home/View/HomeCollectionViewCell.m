//
//  HomeCollectionViewCell.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/8.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@implementation HomeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTradeCellWithModel:(HomeTradeCellModel *)tradeModel
{
    [self.tradeImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",tradeModel.coverPic]]];
    self.tradeTitleLab.text = tradeModel.name;
    self.tradePriceLab.text = [NSString stringWithFormat:@"%.2f元/份",tradeModel.packPrice.floatValue];
}

- (IBAction)tradeAddAction:(UIButton *)sender
{
    if (self.tradeCellBlock)
    {
        self.tradeCellBlock();
    }
}


@end
