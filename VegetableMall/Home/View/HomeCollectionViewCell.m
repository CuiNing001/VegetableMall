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
    
}

- (IBAction)tradeAddAction:(UIButton *)sender
{
    if (self.tradeCellBlock)
    {
        self.tradeCellBlock();
    }
}


@end
