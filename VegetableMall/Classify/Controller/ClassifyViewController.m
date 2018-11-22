//
//  ClassifyViewController.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/10/30.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "ClassifyViewController.h"
#import "ClassGoodsCategoryModel.h"
#import "ClassGoodsListModel.h"
#import "ClassifyGoodsListTableViewCell.h"
#import "ClassifyCollectionViewCell.h"
#import "ClassCategoryTableViewCell.h"


static NSString * const leftCellIdentifier       = @"leftCell";
static NSString * const rightCellIdentifier      = @"rightCell";
static NSString * const rightCellNibName         = @"ClassifyGoodsListTableViewCell";
static NSString * const leftCellNibName          = @"ClassCategoryTableViewCell";
static NSString * const collectionCellNibName    = @"ClassifyCollectionViewCell";
static NSString * const collectionCellIdentifier = @"collectionCell";
@interface ClassifyViewController ()<
    UITableViewDelegate,
    UITableViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
>

@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeight;


@property (strong, nonatomic) NSMutableArray *leftTableViewDataSource;
@property (strong, nonatomic) NSMutableArray *rightTableViewDataSource;
@property (strong, nonatomic) NSMutableArray *collectionViewDataSource;


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
    [self addDelegate];
    [self setUpTableViewUI];
    [self setUpCollectionViewUI];
}
- (void)addDelegate
{
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
}
- (void)setUpTableViewUI
{
    [self.leftTableView registerNib:[UINib nibWithNibName:leftCellNibName bundle:nil] forCellReuseIdentifier:leftCellIdentifier];
    [self.rightTableView registerNib:[UINib nibWithNibName:rightCellNibName bundle:nil] forCellReuseIdentifier:rightCellIdentifier];
}
- (void)setUpCollectionViewUI
{
    [self.collectionView registerNib:[UINib nibWithNibName:collectionCellNibName bundle:nil] forCellWithReuseIdentifier:collectionCellIdentifier];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize = CGSizeMake(80, 30);
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.collectionView.collectionViewLayout = flowLayout;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    [self updataCollectionViewHeight];
}
// 获取并更新collection view高度
- (void)updataCollectionViewHeight
{
    [self.collectionView setNeedsLayout];
    CGFloat height = self.collectionView.collectionViewLayout.collectionViewContentSize.height;
    self.collectionViewHeight.constant = height;
}

#pragma mark - get data
- (void)loadData
{
    [self loadGoodsCategoryListDataWithPid:@"0"];
}
// 左侧tableview数据
- (void)loadGoodsCategoryListDataWithPid:(NSString *)pid
{
    [[DataSource getDataManager]fetchGoodsCategoryListWithPid:pid success:^(id  _Nonnull result)
    {
        for (NSDictionary *dic in result)
        {
            ClassGoodsCategoryModel *model = [ClassGoodsCategoryModel mj_objectWithKeyValues:dic];
            [self.leftTableViewDataSource addObject:model];
        }
        [self loadChooseGoodsListWithModel:self.leftTableViewDataSource[0]];
        [self.leftTableView reloadData];
        [self selectByDefaultWithTableView:self.leftTableView];
    }
    faile:^(id  _Nonnull error)
    {
        
    }];
}
// 默认选中cell
- (void)selectByDefaultWithTableView:(UITableView *)tableView
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
}
// 右侧tableview数据
- (void)loadGoodsListDataWithCategoryId:(NSString *)categoryId pid:(NSString *)pid
{
    [[DataSource getDataManager]fetchGoodsListWithPid:pid categoryId:categoryId success:^(id  _Nonnull result)
    {
        [self.rightTableViewDataSource removeAllObjects];
        for (NSDictionary *dic in result)
        {
            ClassGoodsListModel *model = [ClassGoodsListModel mj_objectWithKeyValues:dic];
            [self.rightTableViewDataSource addObject:model];
        }
        [self.rightTableView reloadData];
        [self selectByDefaultWithTableView:self.rightTableView];
    }
    faile:^(id  _Nonnull error)
    {
        
    }];
}

// 获取当前分类下所有数据
- (void)loadChooseGoodsListWithModel:(ClassGoodsCategoryModel *)model
{
    NSString *pid = [NSString stringWithFormat:@"%@",model.id];
    NSString *categoryId = @"";
    [self loadGoodsListDataWithCategoryId:categoryId pid:pid];
}

#pragma mark - action

#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 201)
    {
        return 50;
    }
    else
    {
        return 100;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 201)
    {
        return self.leftTableViewDataSource.count;
    }
    else
    {
        return self.rightTableViewDataSource.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 201)
    {
        ClassCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:leftCellIdentifier forIndexPath:indexPath];
        ClassGoodsCategoryModel *model = self.leftTableViewDataSource[indexPath.row];
        cell.titleLabel.text = model.name;
        cell.titleLabel.font = [UIFont systemFontOfSize:13];
        return cell;
    }
    else
    {
        ClassifyGoodsListTableViewCell *rightCell = [tableView dequeueReusableCellWithIdentifier:rightCellIdentifier forIndexPath:indexPath];
        ClassGoodsListModel *model = self.rightTableViewDataSource[indexPath.row];
        [rightCell setCellDataWithModel:model];
        rightCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return rightCell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView.tag ==201)
    {
        ClassGoodsCategoryModel *model = self.leftTableViewDataSource[indexPath.row];
        [self loadChooseGoodsListWithModel:model];
    }
    else
    {
        
    }
}


#pragma mark - collection delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ClassifyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellIdentifier forIndexPath:indexPath];
    return cell;
}

#pragma lazy
- (NSMutableArray *)leftTableViewDataSource
{
    if (!_leftTableViewDataSource)
    {
        self.leftTableViewDataSource = [NSMutableArray array];
    }
    return _leftTableViewDataSource;
}
- (NSMutableArray *)rightTableViewDataSource
{
    if (!_rightTableViewDataSource)
    {
        self.rightTableViewDataSource = [NSMutableArray array];
    }
    return _rightTableViewDataSource;
}
- (NSMutableArray *)collectionViewDataSource
{
    if (!_collectionViewDataSource)
    {
        self.collectionViewDataSource = [NSMutableArray array];
    }
    return _collectionViewDataSource;
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
