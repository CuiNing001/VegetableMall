//
//  ClassifyCollectionViewCell.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/22.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "ClassifyCollectionViewCell.h"

@implementation ClassifyCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected
{
    if (selected)
    {
        self.warpView.backgroundColor = [UIColor colorWithHex:@"#43C746" alpha:1];
        self.titleLabel.textColor = [UIColor whiteColor];
        [self.warpView cornerRadiusWithAngle:3.0f];
    }
    else
    {
        [self.warpView cornerRadiusWithAngle:3.0f];
        [self.warpView borderWithColor:@"#DCDCDC" width:0.5f];
        self.warpView.backgroundColor = [UIColor colorWithHex:@"#F5F5F5" alpha:1];
        self.titleLabel.textColor = [UIColor blackColor];
    }
}

@end
