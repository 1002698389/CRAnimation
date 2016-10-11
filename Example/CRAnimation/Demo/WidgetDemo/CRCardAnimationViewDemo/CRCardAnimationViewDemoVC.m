//
//  CRCardAnimationViewDemoVC.m
//  CRAnimation
//
//  Created by Bear on 16/10/11.
//  Copyright © 2016年 BearRan. All rights reserved.
//

#import "CRCardAnimationViewDemoVC.h"
#import "CRCardAnimationView.h"

@interface CRCardAnimationViewDemoVC () <CardAnimationViewDelegate>
{
    
    CRCardAnimationView *_cardAnimationView;
}

@end

@implementation CRCardAnimationViewDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    [self addTopBar];
}

- (void)createUI
{
    _cardAnimationView = [[CRCardAnimationView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    _cardAnimationView.delegate = self;
    _cardAnimationView.backgroundColor = [UIColor clearColor];
    _cardAnimationView.cardShowInView_Count = 3;
    _cardAnimationView.cardOffSetPoint = CGPointMake(0, 30);
    _cardAnimationView.cardScaleRatio  = 0.09;
    _cardAnimationView.cardCycleShow = YES;
    [self.view addSubview:_cardAnimationView];
}


#pragma mark - CardAnimationView delegate

- (CRCardViewCell *)cardViewInCardAnimationView:(CRCardAnimationView *)cardAnimationView AtIndex:(int)index
{
    CGFloat cardView_width = (1.0 * 540 / 640) * WIDTH;
    CGFloat cardView_height = (1.0 * 811 / 1134) * HEIGHT;
    NSString *cardViewID_Str = @"cardViewID_Str";
    
    CRCardViewCell *cardView = (CRCardViewCell *)[cardAnimationView dequeueReusableCardViewCellWithIdentifier:cardViewID_Str];
    if (!cardView) {
        cardView = [[CRCardViewCell alloc] initWithFrame:CGRectMake(0, 0, cardView_width, cardView_height) reuseIdentifier:cardViewID_Str];
    }
    
    cardView.backgroundColor = [UIColor orangeColor];
    
    return cardView;
}

- (NSInteger)numberOfCardsInCardAnimationView:(CRCardAnimationView *)cardAnimationView
{
    return 10;
}

- (void)cardViewWillShowWithIndex:(NSInteger)index
{
    NSLog(@"index:%ld", (long)index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
