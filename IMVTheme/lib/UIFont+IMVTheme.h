//
//  UIFont+IMVTheme.h
//  IMVCommon
//
//  Created by 陈少华 on 15/4/10.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IMVFontNaviBarTitle @"naviBarTitleFont"
#define IMVFontNaviBarItemTitle @"naviBarItemTitleFont"
#define IMVFontTabBarItemTitle @"tabBarItemTitleFont"

#define IMVFontTitle @"titleFont"
#define IMVFontDetail @"detailFont"

@interface UIFont (IMVTheme)

+ (UIFont *)fontForName:(NSString *)name;

+ (UIFont *)fontForNaviBarTitle;
+ (UIFont *)fontForNaviBarItemTitle;
+ (UIFont *)fontForTabBarItemTitle;
+ (UIFont *)fontForTitle;
+ (UIFont *)fontForDetail;

@end
