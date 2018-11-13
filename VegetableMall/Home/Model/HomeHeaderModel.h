//
//  HomeHeaderModel.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/13.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeHeaderModel : BaseModel

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *picture;
@property (strong, nonatomic) NSString *categoryId;
@property (strong, nonatomic) NSMutableArray *goodsList;

@end

NS_ASSUME_NONNULL_END
