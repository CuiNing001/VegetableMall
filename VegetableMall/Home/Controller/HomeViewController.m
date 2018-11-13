//
//  HomeViewController.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/10/30.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeNavLeftItemView.h"
#import "HomeTradeWarpTableViewCell.h"
#import "HomeTradeHeaderView.h"
#import "HomeIndexDataModel.h"
#import "HomeHeaderModel.h"

@interface HomeViewController ()<
    UITableViewDelegate,
    UITableViewDataSource
>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *warpView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *warpViewHeight;
@property (weak, nonatomic) IBOutlet UIView *bannerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *bannerListArray;         // 轮播图
@property (strong, nonatomic) NSMutableArray *categoryListArray;       // 分类图标
@property (strong, nonatomic) NSMutableArray *categoryGoodsListArray;  // 分类商品

@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpUI];
    
    [self loadData];
}

//- (void)viewDidLayoutSubviews
//{
//    [self.tableView layoutIfNeeded];
//}

#pragma mark - init
- (void)setUpUI
{
    [self customNavigationBar];
    [self.bannerView shadowWithColor:[UIColor blackColor]];
    [self setUpTableViewUI];
}

- (void)customNavigationBar
{
    HomeNavLeftItemView *leftItemView = [[HomeNavLeftItemView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, Height_NavBar)];
    [self.view addSubview:leftItemView];
    
    leftItemView.chooseLocationBlock = ^{
        
    };
    leftItemView.chooseMessageBlock = ^{

    };
}

- (void)setUpTableViewUI
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTradeWarpTableViewCell" bundle:nil] forCellReuseIdentifier:@"tradeWarpCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTradeHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"tradeWarpView"];
}

#pragma mark - action
- (IBAction)searchAction:(UIButton *)sender
{
    
}

- (IBAction)chooseClassAction:(UIButton *)sender
{
    switch (sender.tag)
    {
        case 101:
            NSLog(@"精选蔬菜");
            break;
        case 102:
            NSLog(@"精选水果");
            break;
        case 103:
            NSLog(@"粮油干货");
            break;
        case 104:
            NSLog(@"肉禽水产");
            break;
        case 105:
            NSLog(@"中式面点");
            break;
        case 106:
            NSLog(@"家居日化");
            break;
        case 107:
            NSLog(@"新品尝鲜");
            break;
        case 108:
            NSLog(@"饮料冲饮");
            break;
            
        default:
            break;
    }
}

#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.categoryGoodsListArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HomeTradeHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"tradeWarpView"];
    if (headerView == nil) {
        headerView = [[HomeTradeHeaderView alloc] initWithReuseIdentifier:@"tradeWarpView"];
    }
    HomeHeaderModel *headerModel = [[HomeHeaderModel alloc]init];
    [headerModel setValuesForKeysWithDictionary:self.categoryGoodsListArray[section]];
    [headerView setButtonImageWithModel:headerModel];
    headerView.headerChooesBtnBlock = ^{
        
    };
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTradeWarpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tradeWarpCell" forIndexPath:indexPath];
    if (self.categoryGoodsListArray.count>0)
    {
        NSMutableArray *goodsList = [self.categoryGoodsListArray[indexPath.section] objectForKey:@"goodsList"];
        [cell setValueWithListArray:goodsList];
        
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"table view index section:%ld",indexPath.section);
}


#pragma mark - load data
- (void)loadData
{
    [self loadIndexData];
}

- (void)loadIndexData
{
    [[DataSource getDataManager]fetchIndexSuccess:^(id  _Nonnull result)
    {
        HomeIndexDataModel *model = [HomeIndexDataModel mj_objectWithKeyValues:result];
        [self.bannerListArray addObjectsFromArray:model.bannerList];
        [self.categoryListArray addObjectsFromArray:model.categoryList];
        [self.categoryGoodsListArray addObjectsFromArray:model.categoryGoodsList];
        [self upDataTableViewLayout];
    }
    faile:^(id  _Nonnull error)
    {
        
    }];
}

#pragma mark - layout
- (void)upDataTableViewLayout
{
    [self.tableView reloadData];
    [self.tableView setNeedsLayout];
    NSInteger sectionCount = self.categoryGoodsListArray.count;
    self.warpViewHeight.constant = (44+60+160+200+10)+(sectionCount*100)+(140*sectionCount);
}

#pragma mark - lazy
- (NSMutableArray *)bannerListArray
{
    if (!_bannerListArray)
    {
        self.bannerListArray = [NSMutableArray array];
    }
    return _bannerListArray;
}
- (NSMutableArray *)categoryListArray
{
    if (!_categoryListArray)
    {
        self.categoryListArray = [NSMutableArray array];
    }
    return _categoryListArray;
}
-(NSMutableArray *)categoryGoodsListArray
{
    if (!_categoryGoodsListArray)
    {
        self.categoryGoodsListArray = [NSMutableArray array];
    }
    return _categoryGoodsListArray;
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
