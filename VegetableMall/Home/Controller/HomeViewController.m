//
//  HomeViewController.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/10/30.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "HomeViewController.h"


@interface HomeViewController ()
@property (strong, nonatomic) NSString *netTime;
@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
