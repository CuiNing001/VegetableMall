//
//  HomeCollectionHeaderView.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/8.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeCollectionHeaderView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIButton *headerButton;
@property (copy, nonatomic) void(^tradeHeaderBlock)(void);

@end

NS_ASSUME_NONNULL_END
