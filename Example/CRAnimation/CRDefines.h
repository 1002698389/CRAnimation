//
//  CRDefines.h
//  CRAnimation
//
//  Created by Bear on 16/10/12.
//  Copyright © 2016年 BearRan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define color_Master    [UIColor blackColor]
#define color_323341    UIColorFromHEX(0x323341)
#define color_5868f2    UIColorFromHEX(0x5868f2)
#define color_c5c5c5    UIColorFromHEX(0xc5c5c5)
#define color_777777    UIColorFromHEX(0x777777)
#define color_e5e5e5    UIColorFromHEX(0xe5e5e5)

#define color_354ff1    UIColorFromHEX(0x354ff1)
#define color_e1e3ff    UIColorFromHEX(0xe1e3ff)


//  适配对应 高度 < 5高度时，高度 = 5高度
#define LayOutHeight  ((HEIGHT < HEIGHT5) ? HEIGHT5 : HEIGHT)

//  物理点 为单位
#define XX_4(value)     (1.0 * (value) * WIDTH / WIDTH4)
#define XX_5(value)     (1.0 * (value) * WIDTH / WIDTH5)
#define XX_6(value)     (1.0 * (value) * WIDTH / WIDTH6)
#define XX_6P(value)    (1.0 * (value) * WIDTH / WIDTH6P)

#define YY_4(value)     (1.0 * (value) * LayOutHeight / HEIGHT4)
#define YY_5(value)     (1.0 * (value) * LayOutHeight / HEIGHT5)
#define YY_6(value)     (1.0 * (value) * LayOutHeight / HEIGHT6)
#define YY_6P(value)    (1.0 * (value) * LayOutHeight / HEIGHT6P)


//  像素点 为单位
#define XX_4N(value)     (1.0 * (value) * WIDTH / NWIDTH4)
#define XX_5N(value)     (1.0 * (value) * WIDTH / NWIDTH5)
#define XX_6N(value)     (1.0 * (value) * WIDTH / NWIDTH6)
#define XX_6PN(value)    (1.0 * (value) * WIDTH / NWIDTH6P)

#define YY_4N(value)     (1.0 * (value) * LayOutHeight / NHEIGHT4)
#define YY_5N(value)     (1.0 * (value) * LayOutHeight / NHEIGHT5)
#define YY_6N(value)     (1.0 * (value) * LayOutHeight / NHEIGHT6)
#define YY_6PN(value)    (1.0 * (value) * LayOutHeight / NHEIGHT6P)


//  AppDelegate
#define JKZJAPP_Delegate  (AppDelegate *)[[UIApplication sharedApplication] delegate]


//  Font
#define SystemFont(value)       [UIFont systemFontOfSize:value]
#define FontSize(value)         [UIFont systemFontOfSize:(CGFloat)floor(value)]
#define FontSize_4(value)       FontSize(XX_4(value))
#define FontSize_5(value)       FontSize(XX_5(value))
#define FontSize_6(value)       FontSize(XX_6(value))
#define FontSize_6P(value)      FontSize(XX_6P(value))


@interface CRDefines : NSObject

@end
