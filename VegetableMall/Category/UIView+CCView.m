//
//  UIView+CCView.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/1.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "UIView+CCView.h"

@implementation UIView (CCView)

#pragma mark - 添加到window
-(void) addToWindow
{
    id appDelegate = [[UIApplication sharedApplication] delegate];
    if ([appDelegate respondsToSelector:@selector(window)])
    {
        UIWindow * window = (UIWindow *) [appDelegate performSelector:@selector(window)];
        [window addSubview:self];
    }
}

#pragma mark - 添加圆角
- (void)cornerRadiusWithAngle:(CGFloat)angle
{
    self.layer.cornerRadius  = angle;
    self.layer.masksToBounds = YES;
}

#pragma mark - 添加边框
- (void)borderWithColor:(NSString *)color width:(CGFloat )width
{
    self.layer.borderColor = [UIColor colorWithHex:color alpha:1].CGColor;
    self.layer.borderWidth = width;
}

#pragma mark - 添加阴影
- (void)shadowWithColor:(UIColor *)color
{
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = CGSizeMake(2, 0);
    self.layer.shadowOpacity = 0.3;
    self.layer.shadowRadius = 4;
}

#pragma mark - 抖动动画
- (void) shakeAnimation
{
    CALayer* layer = [self layer];
    CGPoint position = [layer position];
    CGPoint y = CGPointMake(position.x - 8.0f, position.y);
    CGPoint x = CGPointMake(position.x + 8.0f, position.y);
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction
                                  functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    [animation setAutoreverses:YES];
    [animation setDuration:0.08f];
    [animation setRepeatCount:3];
    [layer addAnimation:animation forKey:nil];
}

#pragma mark - 旋转动画
- (void)rotationAnimation
{
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    rotation.duration = 1;
    rotation.repeatCount = 1;
    rotation.autoreverses = NO;
    rotation.removedOnCompletion = YES;
    rotation.fillMode = kCAFillModeBackwards;
    [self.layer addAnimation:rotation forKey:@"rotation"];
}

#pragma mark - 缩放动画
- (void)scaleAnimation
{
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    scale.toValue = [NSNumber numberWithFloat:1.5];
    scale.removedOnCompletion = YES;
    scale.autoreverses = YES; 
    scale.duration = 0.5;
    scale.fillMode = kCAFillModeBackwards;
    [self.layer addAnimation:scale forKey:@"scale"];
}

#pragma mark - 闪烁动画
- (void)flickerAnimation
{
    CABasicAnimation *flicker = [CABasicAnimation animationWithKeyPath:@"opacity"];
    flicker.fromValue = [NSNumber numberWithFloat:1.0f];
    flicker.toValue = [NSNumber numberWithFloat:0.0f];
    flicker.duration = 1.0;
    flicker.repeatCount = 2;
    flicker.removedOnCompletion = YES;
    flicker.autoreverses = YES;
    flicker.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    flicker.fillMode = kCAFillModeBackwards;
    [self.layer addAnimation:flicker forKey:@"opacity"];
}


@end
