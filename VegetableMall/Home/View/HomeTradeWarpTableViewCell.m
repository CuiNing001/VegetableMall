//
//  HomeTradeWarpTableViewCell.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/9.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "HomeTradeWarpTableViewCell.h"
#import "HomeCollectionViewCell.h"
#import "HomeTradeCellModel.h"

@interface HomeTradeWarpTableViewCell ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation HomeTradeWarpTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self setUpCollectionViewLayout];
}

- (void)setUpCollectionViewLayout
{
    self.goodsListArray = [NSMutableArray array];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"tradeCell"];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH/3, 135);
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 0;
    self.collectionView.collectionViewLayout = flowLayout;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

#pragma mark - collection delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.goodsListArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tradeCell" forIndexPath:indexPath];
    cell.tradeCellBlock = ^{
        NSLog(@"add index :%ld",indexPath.row);
    };
    if (self.goodsListArray.count>0)
    {
        HomeTradeCellModel *model = self.goodsListArray[indexPath.row];
        [cell setTradeCellWithModel:model];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"item index :%ld",indexPath.row);
}

- (void)setValueWithListArray:(NSMutableArray *)listArray
{
    [self.goodsListArray removeAllObjects];
    for (NSDictionary *dic in listArray) {
        HomeTradeCellModel *model = [[HomeTradeCellModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [self.goodsListArray addObject:model];
    }
    [UIView animateWithDuration:1 animations:^{
         [self.collectionView reloadData];
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
