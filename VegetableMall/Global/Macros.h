//
//  Macros.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/1.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

//iphoneX
#define SafeAreaBottomHeight (SCREEN_HEIGHT == 812.0 ? 34 : 0)
#define SafeAreaTopHeight (SCREEN_HEIGHT == 812.0 ? 88 : 64)
#define IS_IPHONE_X (SCREEN_HEIGHT == 812.0) ? YES : NO
#define Height_NavContentBar 44.0
#define Height_StatusBar (IS_IPHONE_X==YES)?44.0: 20.0
#define Height_NavBar (IS_IPHONE_X==YES)?88.0: 64.0
#define Height_TabBar (IS_IPHONE_X==YES)?83.0: 49.0

// 设备的高和宽
#define     SCREEN_WIDTH    ([[UIScreen mainScreen] bounds].size.width)
#define     SCREEN_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)

// 设备类型
#define IS_IPAD         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA       ([[UIScreen mainScreen] scale] >= 2.0)

#define IS_IPHONE_4_OR_LESS     (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5             (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_5_OR_LESS     (IS_IPHONE && SCREEN_MAX_LENGTH <= 568.0)
#define IS_IPHONE_6_OR_LESS     (IS_IPHONE_6 || IS_IPHONE_6P)
#define IS_IPHONE_6             (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P            (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

// 系统版本
#define SYSTEM_VERSION_STRING [[UIDevice currentDevice] systemVersion]
#define IOS10_OR_LATER ([SYSTEM_VERSION_STRING floatValue] >= 10.0)
#define IOS9_OR_LATER ([SYSTEM_VERSION_STRING floatValue] >= 9.0)
#define IOS8_OR_LATER ([SYSTEM_VERSION_STRING floatValue] >= 8.0)
#define IOS7_OR_LATER ([SYSTEM_VERSION_STRING floatValue] >= 7.0)


#endif /* Macros_h */
