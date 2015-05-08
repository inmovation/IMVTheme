//
//  UIColor+IMVTheme.h
//  IMVCommon
//
//  Created by 陈少华 on 15/4/10.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  推荐使用这些方法来获取颜色
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

@end
