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

@interface HomeViewController ()<
    UITableViewDelegate,
    UITableViewDataSource
>


@property (strong, nonatomic) NSString *netTime;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *warpView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *warpViewHeight;
@property (weak, nonatomic) IBOutlet UIView *bannerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


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
}

- (void)viewDidLayoutSubviews
{
    [self.tableView layoutIfNeeded];
    self.warpViewHeight.constant = (44+60+160+200+10)+(3*100)+(140*3);
}

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
    return 3;
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
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTradeWarpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tradeWarpCell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"table view index section:%ld",indexPath.section);
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
