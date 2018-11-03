//
//  NSDictionary+ToJson.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/2.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (ToJson)

/**
 *  字典转成json字符串
 *
 *  @return json 字符串
 */
- (NSString *)transToJSONString;

@end

NS_ASSUME_NONNULL_END
