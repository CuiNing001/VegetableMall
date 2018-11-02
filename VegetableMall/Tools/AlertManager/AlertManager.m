//
//  AlertManager.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/1.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "AlertManager.h"

@implementation AlertManager

+ (AlertManager *)alertShareManager
{
    static AlertManager *alertManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertManager = [[AlertManager alloc]init];
    });
    return alertManager;
}

- (void)toastWithMessage:(NSString *)message time:(NSTimeInterval)time
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *showView = [[UIView alloc]init];
    showView.backgroundColor = [UIColor blackColor];
    showView.frame   = CGRectMake(1, 1, 1, 1);
    showView.alpha   = 1.0f;
    showView.layer.cornerRadius = 5.0;
    showView.layer.masksToBounds = YES;
    [window addSubview:showView];
    UILabel *label = [[UILabel alloc]init];
    UIFont  *font  = [UIFont systemFontOfSize:15];
    CGRect   rect  = [message boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 30)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:font}
                                           context:nil];
    label.frame           = CGRectMake(10, 5, ceil(CGRectGetWidth(rect)), ceil(CGRectGetHeight(rect)));
    label.text            = message;
    label.textColor       = [UIColor whiteColor];
    label.font            = [UIFont systemFontOfSize:15];
    label.textAlignment   = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [showView addSubview:label];
    showView.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - CGRectGetWidth(rect) - 20)/2,
                                [UIScreen mainScreen].bounds.size.height/2-20,
                                CGRectGetWidth(rect)+20,
                                CGRectGetHeight(rect)+10);
    [UIView animateWithDuration:time animations:^{
        showView.alpha = 0;
    } completion:^(BOOL finished) {
        [showView removeFromSuperview];
    }];
}

- (void)alertWithTitle:(NSString *)title message:(NSString *)message
{
    UIViewController *toRootVC = [[UIApplication sharedApplication]keyWindow].rootViewController;
    while (toRootVC.presentedViewController) {
        toRootVC = toRootVC.presentedViewController;
    }
    UIAlertController *alert   = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action      = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [toRootVC dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:action];
    
    [toRootVC presentViewController:alert animated:YES completion:nil];
}

@end
