//
//  TodayViewController.m
//  launchWidget
//
//  Created by xiaoshi on 2017/5/11.
//  Copyright © 2017年 xiaoshi. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "KSWidgetCell.h"

@interface TodayViewController () <NCWidgetProviding, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<KSWidgetItem *> *itemArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionLeftMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionRightMargin;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //plus的屏幕约束会有偏差
    if (SCREEN_WIDTH>375) {
        self.collectionLeftMargin.constant = -20;
        self.collectionRightMargin.constant = -20;
    } else {
        self.collectionLeftMargin.constant = -16;
        self.collectionRightMargin.constant = -16;
    }
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"KSWidgetCell" bundle:nil] forCellWithReuseIdentifier:@"KSWidgetCell"];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    
    [self dealwithData];
}

- (void)dealwithData
{
    NSString *str = [[NSUserDefaults standardUserDefaults] valueForKey:@"test"];
    NSLog(@"ceshi :   %@", str);
    NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.kamy"];
    NSArray *userDefaultArray = (NSArray *)[shared valueForKey:ItemArrayUserDefault];
    if (userDefaultArray.count==0) {
        KSWidgetItem *item = [KSWidgetItem initItemWithIcon:@"launch" title:@"kamyWidget" url:@"kamyWidget://"];
        userDefaultArray = @[item];
    } else {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in userDefaultArray) {
            KSWidgetItem *item = [KSWidgetItem initItemWithDic:dic];
            [array addObject:item];
        }
        userDefaultArray = [array copy];
    }
    self.itemArray = [NSMutableArray arrayWithArray:userDefaultArray];
    [self.collectionView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize
{
    if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);
    } else {
        NSInteger count = ceil(self.itemArray.count/4.0);
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, count*110);
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KSWidgetCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"KSWidgetCell" forIndexPath:indexPath];
    cell.item = self.itemArray[indexPath.item];
    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.itemArray.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (SCREEN_WIDTH>320) {
        return CGSizeMake(80, 110);
    } else {
        return CGSizeMake(75, 110);
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    KSWidgetItem *item = self.itemArray[indexPath.item];
    [self.extensionContext openURL:[NSURL URLWithString:item.url] completionHandler:^(BOOL success) {
        
    }];
}

#pragma mark - 
- (NSMutableArray *)itemArray
{
    if (!_itemArray) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}
@end
