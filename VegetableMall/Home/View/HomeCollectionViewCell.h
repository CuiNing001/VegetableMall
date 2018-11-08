//
//  HomeCollectionViewCell.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/8.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTradeCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *tradeImageView;
@property (weak, nonatomic) IBOutlet UILabel *tradeTitleLab;
@property (weak, nonatomic) IBOutlet UILabel *tradePriceLab;
@property (weak, nonatomic) IBOutlet UIButton *tradeAddBtn;
@property (copy, nonatomic) void(^tradeCellBlock)(void);

- (void)setTradeCellWithModel:(HomeTradeCellModel *)tradeModel;

@end

NS_ASSUME_NONNULL_END
