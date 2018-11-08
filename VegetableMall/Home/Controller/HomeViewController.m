//
//  HomeViewController.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/10/30.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeNavLeftItemView.h"
#import "HomeCollectionViewCell.h"
#import "HomeCollectionHeaderView.h"


#define NavBarHeight (IS_IPHONE_X==YES)?148.0: 124.0
@interface HomeViewController ()

@property (strong, nonatomic) NSString *netTime;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *warpView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *warpViewHeight;
@property (weak, nonatomic) IBOutlet UIView *bannerView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


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

#pragma mark - init
- (void)setUpUI
{
    [self customNavigationBar];
    [self.bannerView shadowWithColor:[UIColor blackColor]];
    [self setUpCollectionViewUI];
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

- (void)setUpCollectionViewUI
{
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"tradeCell"];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView.collectionViewLayout = flowLayout;
    
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



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
