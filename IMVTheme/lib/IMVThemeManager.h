//
//  IMVThemeManager.h
//  IMVCommon
//
//  Created by 陈少华 on 15/4/10.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMVTheme.h"
#import "UIImage+IMVTheme.h"
#import "UIFont+IMVTheme.h"
#import "UIColor+IMVTheme.h"

#define IMVNotificationThemeChanged @"IMVNotificationThemeChanged"

@interface IMVThemeManager : NSObject

+ (instancetype)sharedInstence;

- (void)useTheme:(NSString *)themeName type:(IMVThemeType)themeType;

- (UIImage *)imageForName:(NSString *)name;

- (UIColor *)colorForName:(NSString *)name;

- (UIFont *)fontForName:(NSString *)name;

@end
