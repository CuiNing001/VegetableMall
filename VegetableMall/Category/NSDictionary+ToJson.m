//
//  NSDictionary+ToJson.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/2.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "NSDictionary+ToJson.h"

@implementation NSDictionary (ToJson)

#pragma mark - 字典转json字符串
- (NSString *)transToJSONString
{
    NSData *paramsJSONData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return [[NSString alloc] initWithData:paramsJSONData encoding:NSUTF8StringEncoding];
}

@end
