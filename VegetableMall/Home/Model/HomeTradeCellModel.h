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

@property (strong, nonatomic) NSString *tradeImage;
@property (strong, nonatomic) NSString *tradeTitle;
@property (strong, nonatomic) NSString *tradePrice;

@end

NS_ASSUME_NONNULL_END
