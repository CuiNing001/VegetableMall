//
//  AFNetManager.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/1.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface AFNetManager : NSObject

+ (AFNetManager *)netShareManager;

// GET请求
- (void)requestGETWithURLStr:(NSString *)urlStr paramDic:(NSDictionary *)paramDic finish:(void (^)(id responserObject))finish enError:(void (^)(NSError *error))enError;

// POST请求
- (void)requestPOSTWithURLStr:(NSString *)urlStr paramDic:(NSDictionary *)paramDic token:(NSString *)token finish:(void(^)(id responserObject))finish enError:(void(^)(NSError *error))enError;

@end

NS_ASSUME_NONNULL_END
