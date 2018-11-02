//
//  AlertManager.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/1.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertManager : NSObject

+ (AlertManager *)alertShareManager;

- (void)toastWithMessage:(NSString *)message time:(NSTimeInterval )time;

- (void)alertWithTitle:(NSString *)title message:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
