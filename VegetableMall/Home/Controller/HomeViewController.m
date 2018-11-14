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
#import "HomeDiscountModel.h"
#import "HomePreGoodsModel.h"
#import "HomeCategoryModel.h"
#import "HomeBannerModel.h"

@interface HomeViewController ()<
    UITableViewDelegate,
    UITableViewDataSource,
    SDCycleScrollViewDelegate
>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *warpView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *warpViewHeight;
@property (weak, nonatomic) IBOutlet UIView *bannerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *vegetableBtn;  // 精品蔬菜
@property (weak, nonatomic) IBOutlet UIButton *fruitBtn;      // 精选水果
@property (weak, nonatomic) IBOutlet UIButton *oilBtn;        // 粮油干货
@property (weak, nonatomic) IBOutlet UIButton *fishBtn;       // 肉禽水产
@property (weak, nonatomic) IBOutlet UIButton *breadBtn;      // 中式面点
@property (weak, nonatomic) IBOutlet UIButton *homeBtn;       // 家居日化
@property (weak, nonatomic) IBOutlet UIButton *freshBtn;      // 新品尝鲜
@property (weak, nonatomic) IBOutlet UIButton *drinkBtn;      // 饮料冲饮

@property (strong, nonatomic) NSMutableArray *bannerListArray;         // 轮播图
@property (strong, nonatomic) NSMutableArray *categoryListArray;       // 分类图标
@property (strong, nonatomic) NSMutableArray *categoryGoodsListArray;  // 分类商品
@property (strong, nonatomic) NSMutableArray *discountGoodsArray;      // 特价商品
@property (strong, nonatomic) NSMutableArray *preGoodsArray;           // 预售商品
@property (strong, nonatomic) NSMutableArray *goodsListArray;          // 商品array
@property (strong, nonatomic) NSMutableArray *headerArray;             // headerArray
@property (strong, nonatomic) HomeDiscountModel *discountModel;        // 特价商品model
@property (strong, nonatomic) HomePreGoodsModel *preGoodsModel;        // 预售商品model

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
    self.tableView.separatorColor = [UIColor clearColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTradeWarpTableViewCell" bundle:nil] forCellReuseIdentifier:@"tradeWarpCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTradeHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"tradeWarpView"];
}

- (void)setClassButtonIconWithButtonArray:(NSMutableArray *)buttonArray
{
    NSMutableArray *array = @[
                                self.vegetableBtn,
                                self.fruitBtn,
                                self.oilBtn,
                                self.fishBtn,
                                self.breadBtn,
                                self.homeBtn,
                                self.freshBtn,
                                self.drinkBtn
                            ].mutableCopy;
    for (int i = 0; i<array.count; i++)
    {
        HomeCategoryModel *model = [HomeCategoryModel mj_objectWithKeyValues:buttonArray[i]];
        NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.thump]];
        UIButton *button = array[i];
        [button rotationAnimation];
        [button sd_setImageWithURL:imageUrl forState:UIControlStateNormal];
    }
}

- (void)setCycleBannerImageWithImageArray:(NSMutableArray *)imageArray
{
    NSMutableArray *imageUrlArr = [NSMutableArray array];
    for (NSDictionary *dic in imageArray)
    {
        HomeBannerModel *model = [HomeBannerModel mj_objectWithKeyValues:dic];
        [imageUrlArr addObject:model.picture];
    }
    SDCycleScrollView *cyclesView = [SDCycleScrollView cycleScrollViewWithFrame:self.bannerView.bounds imageURLStringsGroup:imageUrlArr];
    cyclesView.delegate = self;
    cyclesView.imageURLStringsGroup = imageUrlArr;
    cyclesView.backgroundColor = [UIColor clearColor];
    cyclesView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    cyclesView.autoScrollTimeInterval = 3.0f;
    cyclesView.contentMode = UIViewContentModeScaleToFill;
    [cyclesView cornerRadiusWithAngle:4.0f];
    [self.bannerView addSubview:cyclesView];
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
    NSInteger sectionCount = self.categoryGoodsListArray.count;
    if (self.discountGoodsArray.count>0)
    {
        sectionCount +=1;
    }
    if (self.preGoodsArray.count>0)
    {
        sectionCount +=1;
    }
    return sectionCount;
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
    [self setHeaderDataWithHeader:headerView section:section];
    headerView.headerChooesBtnBlock = ^{
        
    };
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTradeWarpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tradeWarpCell" forIndexPath:indexPath];
    if (self.categoryGoodsListArray.count>0)
    {
        [self setCellDataWithCell:cell indexPath:indexPath];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"table view index section:%ld",indexPath.section);
}

- (void)setCellDataWithCell:(HomeTradeWarpTableViewCell *)cell indexPath:(NSIndexPath *)indexPath
{
    if (self.discountGoodsArray.count>0 && self.preGoodsArray.count==0)
    {
        if (indexPath.section == 0)
        {
            [cell setValueWithListArray:self.discountGoodsArray];
        }
        else
        {
            NSMutableArray *goodsList = [self.categoryGoodsListArray[indexPath.section-1] objectForKey:@"goodsList"];
            [cell setValueWithListArray:goodsList];
        }
    }
    else if (self.discountGoodsArray.count==0 && self.preGoodsArray.count>0)
    {
        if (indexPath.section == 0)
        {
            [cell setValueWithListArray:self.preGoodsArray];
        }
        else
        {
            NSMutableArray *goodsList = [self.categoryGoodsListArray[indexPath.section-1] objectForKey:@"goodsList"];
            [cell setValueWithListArray:goodsList];
        }
    }
    else if (self.discountGoodsArray.count>0 && self.preGoodsArray.count>0)
    {
        if (indexPath.section == 0)
        {
            [cell setValueWithListArray:self.discountGoodsArray];
        }
        else if (indexPath.section == 1)
        {
            [cell setValueWithListArray:self.preGoodsArray];
        }
        else
        {
            NSMutableArray *goodsList = [self.categoryGoodsListArray[indexPath.section-2] objectForKey:@"goodsList"];
            [cell setValueWithListArray:goodsList];
        }
    }
    else
    {
        NSMutableArray *goodsList = [self.categoryGoodsListArray[indexPath.section] objectForKey:@"goodsList"];
        [cell setValueWithListArray:goodsList];
    }
}

- (void)setHeaderDataWithHeader:(HomeTradeHeaderView *)headerView section:(NSInteger)section
{
    if (self.discountGoodsArray.count>0 && self.preGoodsArray.count==0)
    {
        if (section == 0)
        {
            [headerView setButtonImageWithDisModel:self.discountModel];
        }
        else
        {
            HomeHeaderModel *headerModel = [[HomeHeaderModel alloc]init];
            [headerModel setValuesForKeysWithDictionary:self.categoryGoodsListArray[section-1]];
            [headerView setButtonImageWithModel:headerModel];
        }
    }
    else if (self.discountGoodsArray.count==0 && self.preGoodsArray.count>0)
    {
        if (section == 0)
        {
            [headerView setButtonImageWithPreModel:self.preGoodsModel];
        }
        else
        {
            HomeHeaderModel *headerModel = [[HomeHeaderModel alloc]init];
            [headerModel setValuesForKeysWithDictionary:self.categoryGoodsListArray[section-1]];
            [headerView setButtonImageWithModel:headerModel];
        }
    }
    else if (self.discountGoodsArray.count>0 && self.preGoodsArray.count>0)
    {
        if (section == 0)
        {
           [headerView setButtonImageWithDisModel:self.discountModel];
        }
        else if (section == 1)
        {
            [headerView setButtonImageWithPreModel:self.preGoodsModel];
        }
        else
        {
            HomeHeaderModel *headerModel = [[HomeHeaderModel alloc]init];
            [headerModel setValuesForKeysWithDictionary:self.categoryGoodsListArray[section-2]];
            [headerView setButtonImageWithModel:headerModel];
        }
    }
    else
    {
        HomeHeaderModel *headerModel = [[HomeHeaderModel alloc]init];
        [headerModel setValuesForKeysWithDictionary:self.categoryGoodsListArray[section]];
        [headerView setButtonImageWithModel:headerModel];
    }
}

#pragma mark - load data
- (void)loadData
{
    [self loadIndexData];
    
}

// 首页数据
- (void)loadIndexData
{
//    __weak typeof(self)weakSelf = self;
    [[DataSource getDataManager]fetchIndexSuccess:^(id  _Nonnull result)
    {
        HomeIndexDataModel *model = [HomeIndexDataModel mj_objectWithKeyValues:result];
        // banner
        [self.bannerListArray addObjectsFromArray:model.bannerList];
        [self setCycleBannerImageWithImageArray:self.bannerListArray];
        
        // class button
        [self.categoryListArray addObjectsFromArray:model.categoryList];
        [self setClassButtonIconWithButtonArray:self.categoryListArray];
        
        // cell and header
        [self.categoryGoodsListArray addObjectsFromArray:model.categoryGoodsList];
        
        // discount
        self.discountModel = [HomeDiscountModel mj_objectWithKeyValues:model.discountGoods];
        [self.discountGoodsArray addObjectsFromArray:self.discountModel.goodsList];
        
        // pre goods
        self.preGoodsModel = [HomePreGoodsModel mj_objectWithKeyValues:model.preGoods];
        [self.preGoodsArray addObjectsFromArray:self.preGoodsModel.goodsList];
        
        // updata layout
        [self upDataTableViewLayout];
    }
    faile:^(id  _Nonnull error)
    {
        
    }];
}

// 特价商品
- (void)loadDiscountListData
{
    [[DataSource getDataManager]fetchDiscountListSuccess:^(id  _Nonnull resule)
    {
        
    }
    faile:^(id  _Nonnull error)
    {
        
    }];
}

// 预售商品
- (void)loadPreGoodsList
{
    [[DataSource getDataManager]fetchPreListSuccsee:^(id  _Nonnull resule)
    {
        
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
    if (self.discountGoodsArray.count>0)
    {
        sectionCount +=1;
    }
    if (self.preGoodsArray.count>0)
    {
        sectionCount +=1;
    }
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
- (NSMutableArray *)discountGoodsArray
{
    if (!_discountGoodsArray)
    {
        self.discountGoodsArray = [NSMutableArray array];
    }
    return _discountGoodsArray;
}
- (NSMutableArray *)preGoodsArray
{
    if (!_preGoodsArray)
    {
        self.preGoodsArray = [NSMutableArray array];
    }
    return _preGoodsArray;
}
- (NSMutableArray *)goodsListArray
{
    if (!_goodsListArray)
    {
        self.goodsListArray = [NSMutableArray array];
    }
    return _goodsListArray;
}
- (NSMutableArray *)headerArray
{
    if (!_headerArray)
    {
        self.headerArray = [NSMutableArray array];
    }
    return _headerArray;
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
