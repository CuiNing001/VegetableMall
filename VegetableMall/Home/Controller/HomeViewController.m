//
//  HomeViewController.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/10/30.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDictionary *dic = @{@"a":@"123",@"b":@"456",@"c":@"789"};

    NSString *str = [dic transToJSONString];
    
    NSLog(@"dic=>json str:%@",str);
    
    NSDictionary *newDic = [str jsonStringTransToDictionary];
    
    NSLog(@"json str => dic%@",newDic);
    
    self.view.backgroundColor = [UIColor colorWithHex:@"#87CEFA" alpha:1];
    
    UIView *view_1 = [[UIView alloc]initWithFrame:CGRectMake(100, 150, 100, 100)];
    view_1.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:0.8];
    view_1.tag = 1001;
    [view_1 cornerRadiusWithAngle:50.0];
    [self.view addSubview:view_1];
//    NSLog(@"self.view::%@====view_1:%@",NSStringFromCGPoint(self.view.center),NSStringFromCGPoint(view_1.center));
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.text = @"label";
    label.textColor = [UIColor colorWithHex:@"FFFFFF" alpha:1];
    label.textAlignment = NSTextAlignmentCenter;
    [view_1 addSubview:label];
    
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIView *view_1 = [self.view viewWithTag:1001];
    [view_1 scaleAnimation];
    
//    [view_1 flickerAnimation];
    
   
    
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
