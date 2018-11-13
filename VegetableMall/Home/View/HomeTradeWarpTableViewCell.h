//
//  HomeTradeWarpTableViewCell.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/9.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeTradeWarpTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSMutableArray *goodsListArray;

- (void) setValueWithListArray:(NSMutableArray *)listArray;

@end

NS_ASSUME_NONNULL_END
