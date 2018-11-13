//
//  HomeTradeCellModel.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/8.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeTradeCellModel : BaseModel

@property (strong, nonatomic) NSString *goodsId;   // 商品id
@property (strong, nonatomic) NSString *name;      // 商品名称
@property (strong, nonatomic) NSString *coverPic;  // 商品图片
@property (strong, nonatomic) NSString *packPrice; // 商品价格

@end

NS_ASSUME_NONNULL_END
