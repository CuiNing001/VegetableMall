//
//  HomeTradeHeaderView.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/9.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "HomeTradeHeaderView.h"

@implementation HomeTradeHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {
        NSArray *viewArray = [[NSBundle mainBundle]loadNibNamed:@"HomeTradeHeaderView" owner:self options:nil];
        self = viewArray[0];
    }
    return self;
}

- (IBAction)chooseAction:(UIButton *)sender
{
    if (self.headerChooesBtnBlock)
    {
        self.headerChooesBtnBlock();
    }
}

- (void)setButtonImageWithModel:(HomeHeaderModel *)model
{
    NSString *urlStr = [NSString stringWithFormat:@"%@",model.picture];
    [self.chooseButton sd_setImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal];
}

- (void)setButtonImageWithDisModel:(HomeDiscountModel *)DisModel
{
    NSString *urlStr = [NSString stringWithFormat:@"%@",DisModel.discountPic];
    [self.chooseButton sd_setImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal];
}

- (void)setButtonImageWithPreModel:(HomePreGoodsModel *)PreModel
{
    NSString *urlStr = [NSString stringWithFormat:@"%@",PreModel.preSoldPic];
    [self.chooseButton sd_setImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
}


@end
