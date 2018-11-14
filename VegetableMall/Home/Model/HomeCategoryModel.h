//
//  HomeCategoryModel.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/14.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeCategoryModel : BaseModel

@property (strong, nonatomic) NSString *thump;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *categoryId;

@end

NS_ASSUME_NONNULL_END
