//
//  Notification.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/1.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Notification : NSObject

/*
 * FOUNDATION_EXPORT : 修饰 NSString
 * UIKIT_EXTERN      : 修饰 CGFloat/NSInteger
 */

FOUNDATION_EXTERN NSString *const TESTNOTIFICATION;
UIKIT_EXTERN      NSInteger const COUNT;

@end

NS_ASSUME_NONNULL_END
