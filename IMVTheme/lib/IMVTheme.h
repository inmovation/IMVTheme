//
//  IMVTheme.h
//  IMVCommon
//
//  Created by 陈少华 on 15/4/10.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMVStyle.h"

@interface IMVTheme : NSObject

@property (strong, nonatomic) NSBundle *bundle;
@property (strong, nonatomic) NSString *path;

@property (strong, nonatomic) NSMutableDictionary *styles;

+ (IMVTheme *)themeWithBundleName:(NSString *)bundleName;
+ (IMVTheme *)themeWithPath:(NSString *)path;

- (NSDictionary *)dictionary;
- (BOOL)synchronize;

- (UIFont *)fontForName:(NSString *)name;
- (UIColor *)colorForName:(NSString *)name;
- (UIImage *)imageForName:(NSString *)name;

@end
