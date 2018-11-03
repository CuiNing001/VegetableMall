//
//  UIColor+CCColor.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/2.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (CCColor)

/*
 * 根据HEX设置颜色
 */
+ (UIColor *)colorWithHex:(NSString *)hexString alpha:(CGFloat)alpha;

/*
 * 根据RGB设置颜色
 */
+ (UIColor *)colorWithRGB:(NSUInteger)aRGB alpha:(CGFloat)alpha;

/*
 * 调节颜色亮度
 */
+ (UIColor *)colorRGBonvertToHSB:(UIColor*)color withBrighnessDelta:(CGFloat)delta;

/*
 * 调节a颜色透明度
 */
+ (UIColor*) colorRGBonvertToHSB:(UIColor*)color withAlphaDelta:(CGFloat)delta;

@end

NS_ASSUME_NONNULL_END
