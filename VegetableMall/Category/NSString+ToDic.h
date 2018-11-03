//
//  NSString+ToDic.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/2.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ToDic)

/*
 * json字符串转字典
 * return NSDictionary
 */
- (NSDictionary *)jsonStringTransToDictionary;

@end

NS_ASSUME_NONNULL_END
