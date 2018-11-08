//
//  HomeNavLeftItemView.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/8.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "HomeNavLeftItemView.h"

@implementation HomeNavLeftItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        NSArray *viewArray = [[NSBundle mainBundle]loadNibNamed:@"HomeNavLeftItemView" owner:self options:nil];
        self               = viewArray[0];
        self.frame         = frame;
    }
    return self;
}

- (IBAction)myLocationAction:(UIButton *)sender
{
    if (self.chooseLocationBlock)
    {
        self.chooseLocationBlock();
    }
}


- (IBAction)myMessageAction:(UIButton *)sender
{
    if (self.chooseMessageBlock)
    {
        self.chooseMessageBlock();
    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
