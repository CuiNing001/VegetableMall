//
//  ClassGoodsListModel.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/20.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClassGoodsListModel : BaseModel

@property (strong, nonatomic) NSString *coverPic;   // 商品图片
@property (strong, nonatomic) NSString *id;         // 商品id
@property (strong, nonatomic) NSString *name;       // 商品名称
@property (strong, nonatomic) NSString *packPrice;  // 商品包装价格
@property (strong, nonatomic) NSString *type;       // 1-普通商品，3-特价商品，预售商品不显示此处
@property (strong, nonatomic) NSString *unit;       // 单位
@property (strong, nonatomic) NSString *unitPrice;  // 商品单位价格

@end

NS_ASSUME_NONNULL_END
