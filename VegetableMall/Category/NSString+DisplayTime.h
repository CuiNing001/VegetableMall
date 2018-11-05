//
//  NSString+DisplayTime.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/2.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (DisplayTime)

/*
 * 时间戳转换成日期
 * @param: timestamp 时间戳
 */
+ (NSString *)conversionTimeWithTimestamp:(NSString *)timestamp;

/*
 * 获取当前手机时间
 */
+ (NSString *)getLocalDate;

/*
 * 获取当前网络时间
 */
+ (void)getNetDateWithCompletionHandler:(void(^)(NSString *timeStr))completionHandler;

@end

NS_ASSUME_NONNULL_END
