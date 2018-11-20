//
//  ClassifyViewController.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/10/30.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "ClassifyViewController.h"

@interface ClassifyViewController ()

@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation ClassifyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"分类";
    
    [self setUpUI];
    [self loadData];
}

#pragma marrk - system function

#pragma mark - init
- (void)setUpUI
{
    
}

#pragma mark - get data
- (void)loadData
{
    [self loadGoodsCategoryListData];
}

- (void)loadGoodsCategoryListData
{
    [[DataSource getDataManager]fetchGoodsCategoryListWithPid:@"0" success:^(id  _Nonnull result)
    {
        
    }
    faile:^(id  _Nonnull error)
    {
        
    }];
}

- (void)loadGoodsListDataWithCategoryId:(NSString *)categoryId
{
    [[DataSource getDataManager]fetchGoodsListWithPid:@"211" categoryId:categoryId success:^(id  _Nonnull result)
    {
        
    }
    faile:^(id  _Nonnull error)
    {
        
    }];
}

#pragma mark - action

#pragma mark - tableView delegate

#pragma mark - collection delegate

#pragma lazy

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
