//
//  CartViewController.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/10/30.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()<
    UITableViewDelegate,
    UITableViewDataSource,
    DZNEmptyDataSetSource,
    DZNEmptyDataSetDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSourceArray;

@end

@implementation CartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"购物车";
    
    [self setupUI];
    [self loadData];
}

#pragma mark - init
- (void)setupUI
{
    [self addDelegate];
    [self setupTableViewUI];
}
- (void)addDelegate
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
}
- (void)setupTableViewUI
{
    
}

#pragma mark - load data
- (void)loadData
{
    
}

#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourceArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UITableViewCell alloc]init];
}

#pragma mark - emptyData delegate
/**
 *  空n背景title
 */
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    return [[NSAttributedString alloc]initWithString:@"empty data" attributes:nil];;
}
/**
 *  空背景image
 */
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"home_class_fish"];
}

/**
 *  自定义背景颜色
 */
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor whiteColor];
}

/**
 *  数据源为空时是否渲染和显示 (默认为 YES)
 */
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return YES;
}

/**
 *  是否允许点击 (默认为 YES)
 */
- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    return YES;
}

/**
 *  是否允许滚动 (默认为 NO)
 */
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return NO;
}

/**
 *  处理空白区域的点击事件
 */
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    NSLog(@"点击空白");
}

/**
 *  处理按钮的点击事件
 */
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    
}

#pragma mark - lazy
- (NSMutableArray *)dataSourceArray
{
    if (!_dataSourceArray)
    {
        self.dataSourceArray = [NSMutableArray array];
    }
    return _dataSourceArray;
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
