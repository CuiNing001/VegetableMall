//
//  HomeCollectionHeaderView.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/8.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "HomeCollectionHeaderView.h"

@implementation HomeCollectionHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)headerAction:(UIButton *)sender
{
    if (self.tradeHeaderBlock)
    {
        self.tradeHeaderBlock();
    }
}


@end
