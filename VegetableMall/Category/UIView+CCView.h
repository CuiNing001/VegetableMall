//
//  UIView+CCView.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/1.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CCView)

/*
 * 把view加到Window上
 */
- (void)addToWindow;

/*
 * 添加圆角
 */
- (void)cornerRadiusWithAngle:(CGFloat)angle;

/*
 * 添加边框
 */
- (void)borderWithColor:(NSString *)color width:(CGFloat )width;

/*
 * 添加阴影
 */
- (void)shadowWithColor:(UIColor *)color;

/*
 * 左右抖动动画
 */
- (void) shakeAnimation;

/*
 * 添加旋转动画
 */
- (void)rotationAnimation;

/*
 * 缩放动画
 */
- (void)scaleAnimation;

/*
 * 闪烁动画
 */
- (void)flickerAnimation;

@end

NS_ASSUME_NONNULL_END
