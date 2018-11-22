//
//  ClassCategoryTableViewCell.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/22.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "ClassCategoryTableViewCell.h"

@implementation ClassCategoryTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    [self.warpView cornerRadiusWithAngle:5.0f];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (!selected)
    {
        self.warpView.backgroundColor = [UIColor whiteColor];
        self.titleLabel.textColor = [UIColor colorWithHex:@"#43C746" alpha:1];
    }
    else
    {
        self.warpView.backgroundColor = [UIColor colorWithHex:@"#43C746" alpha:1];
        self.titleLabel.textColor = [UIColor whiteColor];
    }
}


@end
