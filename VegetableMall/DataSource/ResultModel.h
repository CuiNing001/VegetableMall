//
//  ResultModel.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/12.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ResultModel : BaseModel

@property (strong, nonatomic) NSString *code;
@property (strong, nonatomic) NSString *msg;
@property (strong, nonatomic) NSString *success;
@property (strong, nonatomic) id data;

@end

NS_ASSUME_NONNULL_END
