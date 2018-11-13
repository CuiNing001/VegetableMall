//
//  HomeIndexDataModel.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/12.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeIndexDataModel : BaseModel

@property (strong, nonatomic) NSDictionary   *preGoods;           // 预售商品
@property (strong, nonatomic) NSMutableArray *bannerList;         // 轮播图
@property (strong, nonatomic) NSMutableArray *categoryGoodsList;  // 分类商品
@property (strong, nonatomic) NSMutableArray *categoryList;       // 分类图标
@property (strong, nonatomic) NSDictionary   *discountGoods;      // 特价商品
@property (strong, nonatomic) NSString       *logo;               // logo

@end

NS_ASSUME_NONNULL_END
