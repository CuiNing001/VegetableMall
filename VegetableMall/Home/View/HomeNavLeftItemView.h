//
//  HomeNavLeftItemView.h
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/8.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeNavLeftItemView : UIView

@property (weak, nonatomic) IBOutlet UILabel *myLoactionLab;
@property (weak, nonatomic) IBOutlet UIButton *myLocationBtn;
@property (weak, nonatomic) IBOutlet UIButton *myMessageBtn;
@property (copy, nonatomic) void(^chooseLocationBlock)(void);
@property (copy, nonatomic) void(^chooseMessageBlock)(void);


- (instancetype)initWithFrame:(CGRect)frame;



@end

NS_ASSUME_NONNULL_END
