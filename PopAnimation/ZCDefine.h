//
//  ZCDefine.h
//  zuche
//
//  Created by fanshen on 15/5/14.
//  Copyright (c) 2015年 zuche. All rights reserved.
//

#import "Masonry.h"


#ifndef zuche_Define_h

#define zuche_Define_h


#define ASSERT(x)     assert(x)

#define ASSERT_Class(x, cls)        ASSERT((x) && ([(x) isKindOfClass:[cls class]]))
#define ASSERT_MainThread()         ASSERT([NSThread isMainThread])
#define isKindOf(x, cls)            [(x) isKindOfClass:[cls class]]

#define IOS5_OR_LATER           (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_5_0)
#define IOS6_OR_LATER           (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_6_0)
#define IOS7_OR_LATER           (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_7_0)
#define IOS8_OR_LATER           (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1)

#define _T(x)           NSLocalizedString((x), nil)     // 多语言字符集



#define _IMAGE(x)         [UIImage imageNamed:(x)]
#define _IMAGE_VIEW(x)      [[UIImageView alloc] initWithImage:_IMAGE(x)]
//#define _IMAGE_FILE(x)    [UIImage imageWithContentsOfFile:(x)]
#define _IMAGE_CG(x)      [UIImage imageWithCGImage:(x)]
#define _IMAGE_DATA(x)    [UIImage imageWithData:(x)]


#define _FONT(x)        [UIFont systemFontOfSize:(x)]
#define _FONT_B(x)      [UIFont boldSystemFontOfSize:(x)]
#define _FONTNAMEWithSIZE(x,y) [UIFont fontWithName:(x) size:(y)]

#define _kColor_clear               [UIColor clearColor]
#define _kColor_black               [UIColor blackColor]
#define _kColor_darkGray            [UIColor darkGrayColor]
#define _kColor_white               [UIColor whiteColor]
#define _kColor_gray                [UIColor grayColor]
#define _kColor_lightGrayColor      [UIColor lightGrayColor]
#define _kColor_red                 [UIColor redColor]
#define _kColor_green               [UIColor greenColor]
#define _kColor_cyan                [UIColor cyanColor]
#define _kColor_blue                [UIColor blueColor]
#define _kColor_yellow              [UIColor yellowColor]
#define _kColor_magenta             [UIColor magentaColor]
#define _kColor_orange              [UIColor orangeColor]
#define _kColor_purple              [UIColor purpleColor]
#define _kColor_brown               [UIColor brownColor]
#define _kColor_rgba(R,G,B,A) [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:A]


#define _kImageWithColor(x,y)  [UIImage ImageWithColor:x frame:y]
//[UIImage ImageWithColor:_kColor_white frame:CGRectMake(0, 0, 180, 65)]

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define center(x) (x).userLocation.location.coordinate






#endif












