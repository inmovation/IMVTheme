//
//  UIFont+IMVTheme.h
//  IMVCommon
//
//  Created by 陈少华 on 15/4/10.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import <UIKit/UIKit.h>

//以下几个必须得在theme.plist中定义
//字体大小
#define IMVFontNaviBarTitle @"naviBarTitleFont"
#define IMVFontNaviBarItemTitle @"naviBarItemTitleFont"
#define IMVFontTabBarItemTitle @"tabBarItemTitleFont"
#define IMVFontTextTitle @"textTitleFont"
#define IMVFontTextDetail @"textDetailFont"

/**
 *  推荐使用该category中的方法来获字体大小，这样可以方便的更换主题
 */
@interface UIFont (IMVTheme)

+ (UIFont *)fontForName:(NSString *)name;

+ (UIFont *)fontForNaviBarTitle;
+ (UIFont *)fontForNaviBarItemTitle;
+ (UIFont *)fontForTabBarItemTitle;
+ (UIFont *)fontForTextTitle;
+ (UIFont *)fontForTextDetail;

@end
