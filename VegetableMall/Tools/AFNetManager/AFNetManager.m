//
//  AFNetManager.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/1.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "AFNetManager.h"

@implementation AFNetManager

+ (AFNetManager *)netShareManager
{
    static AFNetManager *netManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netManager = [[AFNetManager alloc]init];
    });
    return netManager;
}

// GET请求
- (void)requestGETWithURLStr:(NSString *)urlStr paramDic:(id )paramDic finish:(void (^)(id responserObject))finish enError:(void (^)(NSError *error))enError{
    
    // 创建一个sessionManger管理对象
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    
    // 指定我们能够解析的类型包括text/html
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain", nil];
    
    // AFNetworking请求结果回调时,failure方法会在两种情况下回调:1.请求服务器失败,服务器返回失败信息; 2.服务器返回数据成功,AFN解析返回的数据失败
    [manger GET:urlStr parameters:paramDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        finish(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        enError(error);
    }];
    
}

// POST请求
- (void)requestPOSTWithURLStr:(NSString *)urlStr paramDic:(id)paramDic token:(NSString *)token finish:(void(^)(id responserObject))finish enError:(void(^)(NSError *error))enError{
    
    // 创建一个sessionManger管理对象
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    
    if (token!=nil) {
        [manger.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    }
    // 指定我们能够解析的类型包括text/html
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
    
    [manger POST:urlStr parameters:paramDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        finish(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        enError(error);
    }];
    
    
}

@end
