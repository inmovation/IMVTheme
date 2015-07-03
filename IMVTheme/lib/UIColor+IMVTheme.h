//
//  UIColor+IMVTheme.h
//  IMVCommon
//
//  Created by 陈少华 on 15/4/10.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import <UIKit/UIKit.h>

//color
#define IMVColorNaviBarTint @"naviBarTintColor"
#define IMVColorNaviBarBarTint @"naviBarBarTintColor"
#define IMVColorNaviBarTitle @"naviBarTitleColor"
#define IMVColorNaviBarItemTitle @"naviBarItemTitleColor"

#define IMVColorTabBarTint @"tabBarTintColor"
#define IMVColorTabBarBarTint @"tabBarBarTintColor"
#define IMVColorTabBarItemTitleNormal @"tabBarItemTitleNormalColor"
#define IMVColorTabBarItemTitleSelected @"tabBarItemTitleSelectedColor"

#define IMVColorViewBackground @"viewBackgroundColor"
#define IMVColorViewContent @"viewContentColor"

#define IMVColorTextTitle @"textTitleColor"
#define IMVColorTextDetail @"textDetailColor"

/**
 *  推荐使用这些方法来获取颜色，以便更换主题
 */
@interface UIColor (IMVTheme)

/**
 *  根据plist中定义的颜色key获取颜色
 *
 *  @param name plist中定义的key
 *
 *  @return 颜色
 */
+ (UIColor *)colorForName:(NSString *)name;

+ (UIColor *)colorForNaviBarTint;
+ (UIColor *)colorForNaviBarBarTint;
+ (UIColor *)colorForNaviBarTitle;
+ (UIColor *)colorForNaviBarItemTitle;

+ (UIColor *)colorForTabBarTint;
+ (UIColor *)colorForTabBarBarTint;
+ (UIColor *)colorForTabBarItemTitleNormal;
+ (UIColor *)colorForTabBarItemTitleSelected;

+ (UIColor *)colorForViewContent;
+ (UIColor *)colorForViewBackgroud;

+ (UIColor *)colorForTextDetail;
+ (UIColor *)colorForTextTitle;

@end
