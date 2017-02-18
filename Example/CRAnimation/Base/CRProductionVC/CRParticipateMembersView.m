//
//  CRParticipateMembersView.m
//  CRAnimation
//
//  Created by Bear on 17/2/15.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRParticipateMembersView.h"
#import "CRParticipateMemberCollectionCell.h"

static NSString *__collectionViewCellID = @"__collectionViewCellID";

@interface CRParticipateMembersView () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    UICollectionView  *_mainCollectionView;
    NSArray <CRMemberInfoModel *> *_memberInfoModelArray;
}



@end

@implementation CRParticipateMembersView

+ (CRParticipateMembersView *)commonHeadersViewWithWidth:(CGFloat)width
{
    CRParticipateMembersView *view = [[CRParticipateMembersView alloc] initWithWidth:width];
    return view;
}

- (instancetype)initWithWidth:(CGFloat)width
{
    CGFloat defaultHeght = YY_6N(100);
    self = [super initWithFrame:CGRectMake(0, 0, width, defaultHeght)];
    
    if (self) {
        [self createUI];
        [self relayUI];
    }
    
    return self;
}

- (void)createUI
{
    [self createCollectionView];
}

- (void)createCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    _mainCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    _mainCollectionView.delegate = self;
    _mainCollectionView.dataSource = self;
    _mainCollectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_mainCollectionView];
    [_mainCollectionView registerClass:[CRParticipateMemberCollectionCell class] forCellWithReuseIdentifier:__collectionViewCellID];
}

#pragma mark - collectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_memberInfoModelArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CRParticipateMemberCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:__collectionViewCellID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor purpleColor];
    
    CRMemberInfoModel *memberInfoModel = _memberInfoModelArray[indexPath.row];
    [cell setDataWithMemberInfoModel:memberInfoModel];
    
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
    CGFloat cellWidth = XX_6N(100);
    CGFloat cellHeight = cellWidth;
    return (CGSize){cellWidth, cellHeight};
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat cellOffX = 0;
    CGFloat cellOffYStart = 0;
    CGFloat cellOffYEnd = 0;
    return UIEdgeInsetsMake(cellOffYStart, cellOffX, cellOffYEnd, cellOffX);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat cellGapX = XX_6N(24);
    return cellGapX;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat cellGapY = YY_6N(30);
    return cellGapY;
}


#pragma mark - RelayUI

- (void)relayUI
{
    [_mainCollectionView reloadData];
    [_mainCollectionView layoutSubviews];
    [_mainCollectionView setHeight:_mainCollectionView.contentSize.height];
    [self setHeight:_mainCollectionView.height];
}

#pragma mark - setData

- (void)setMemberInfoModelArray:(NSArray<CRMemberInfoModel *> *)memberInfoModelArray
{
    _memberInfoModelArray = memberInfoModelArray;
    [self relayUI];
}

@end
