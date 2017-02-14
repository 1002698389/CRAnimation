//
//  CRCodeWidgetVC.m
//  CRAnimation
//
//  Created by BearRan on 10/07/2016.
//  Copyright (c) 2016 BearRan. All rights reserved.
//

#import "CRCodeWidgetVC.h"
#import "CRCustomNaviBarView.h"
#import "CRDemoInfoModel.h"
#import "CRMemberDetailProductCollectionViewCell.h"

static NSString *__collectionViewCellID = @"__collectionViewCellID";

@interface CRCodeWidgetVC () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    CRCustomNaviBarView     *_naviBarView;
    NSMutableArray <CRDemoInfoModel *> *_demoInfoModelArray;
    
    UICollectionView        *_mainCollectionView;
}

@end

@implementation CRCodeWidgetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createFakeDataWithAddBriefDemoInfo];
    [self createUI];
}

- (void)createFakeDataWithAddBriefDemoInfo
{
    _demoInfoModelArray = [NSMutableArray new];
    for (int i = 0; i < 10; i++) {
        CRDemoInfoModel *demoInfoModel = [CRDemoInfoModel new];
        demoInfoModel.gifAddress = TestCRDemoGifURL_Card;
        [_demoInfoModelArray addObject:demoInfoModel];
    }
}

- (void)createUI
{
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = color_323341;
    
    [self creteNaviBarView];
    [self createCollectionView];
    
    [self.view bringSubviewToFront:_naviBarView];
}

- (void)creteNaviBarView
{
    __weak typeof(self) weakSelf = self;
    _naviBarView = [CRCustomNaviBarView commonNaviBarViewWithTitle:@"精巧控件" inVC:weakSelf];
    _naviBarView.showBackBtn = NO;
    [self.view addSubview:_naviBarView];
}

- (void)createCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _naviBarView.maxY, WIDTH, HEIGHT - _naviBarView.maxY - TABBAR_HEIGHT) collectionViewLayout:layout];
    _mainCollectionView.delegate = self;
    _mainCollectionView.dataSource = self;
    _mainCollectionView.backgroundColor = color_323341;
    [self.view addSubview:_mainCollectionView];
    [_mainCollectionView registerClass:[CRMemberDetailProductCollectionViewCell class] forCellWithReuseIdentifier:__collectionViewCellID];
}


#pragma mark - collectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_demoInfoModelArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CRMemberDetailProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:__collectionViewCellID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor purpleColor];
    
    CRDemoInfoModel *demoInfoModel = _demoInfoModelArray[indexPath.row];
    if (demoInfoModel.gifAddress) {
        [cell loadDemoInfoModel:demoInfoModel];
    }
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        return nil;
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        return nil;
    }
    
    return nil;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellGapX = XX_6N(38);
    CGFloat cellOffX = XX_6N(38);
    
    CGFloat cellWidth = (WIDTH - 2 * cellOffX - 1 * cellGapX) / 2.0;
    CGFloat cellHeight = cellWidth;
    return (CGSize){cellWidth, cellHeight};
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat cellOffX = XX_6N(38);
    CGFloat cellOffYStart = YY_6N(16);
    CGFloat cellOffYEnd = YY_6N(36);
    return UIEdgeInsetsMake(cellOffYStart, cellOffX, cellOffYEnd, cellOffX);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat cellGapX = XX_6N(38);
    return cellGapX;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat cellGapY = YY_6N(30);
    return cellGapY;
}

@end
