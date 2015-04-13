//
//  UIImage+IMVTheme.h
//  IMVCommon
//
//  Created by 陈少华 on 15/4/10.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IMVImageTabBarBackground @"tabBarBackgroundImage"
#define IMVImageNaviBarBackground @"naviBarBackgroundImage"

@interface UIImage (IMVTheme)

+ (UIImage *)imageForName:(NSString *)name;

+ (UIImage *)imageForTabBarBackground;
+ (UIImage *)imageForNaviBarBackground;

@end
