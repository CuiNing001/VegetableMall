//
//  HomeTradeHeaderView.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/9.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeHeaderModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeTradeHeaderView : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UIButton *chooseButton;
@property (copy, nonatomic) void(^headerChooesBtnBlock)(void);

- (void)setButtonImageWithModel:(HomeHeaderModel *)model;

@end

NS_ASSUME_NONNULL_END
