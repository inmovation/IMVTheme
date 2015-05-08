//
//  UIColor+IMVTheme.m
//  IMVCommon
//
//  Created by 陈少华 on 15/4/10.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import "UIColor+IMVTheme.h"
#import "IMVThemeManager.h"

@implementation UIColor (IMVTheme)

+ (UIColor *)colorForName:(NSString *)name
{
    return [[IMVThemeManager sharedInstence] colorForName:name];
}

@end
