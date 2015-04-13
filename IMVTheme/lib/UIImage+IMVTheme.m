//
//  UIImage+IMVTheme.m
//  IMVCommon
//
//  Created by 陈少华 on 15/4/10.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import "UIImage+IMVTheme.h"
#import "IMVThemeManager.h"

@implementation UIImage (IMVTheme)

+ (UIImage *)imageForName:(NSString *)name
{
    return [[IMVThemeManager sharedInstence] imageForName:name];
} 

+ (UIImage *)imageForTabBarBackground
{
    return [self imageForName:IMVImageTabBarBackground];
}

+ (UIImage *)imageForNaviBarBackground
{
    return [self imageForName:IMVImageNaviBarBackground];
}

@end
