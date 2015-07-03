//
//  IMVThemeManager.m
//  IMVCommon
//
//  Created by 陈少华 on 15/4/10.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import "IMVThemeManager.h"
#import "IMVTheme.h"

#define IMVThemeUserDefaultFontOffset @"IMVThemeUserDefaultFontOffset"

@interface IMVThemeManager ()

@property (strong, nonatomic) IMVTheme *theme;

@end

@implementation IMVThemeManager
@synthesize fontOffset = _fontOffset;

+ (instancetype)sharedInstence
{
    static id sharedInstence = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstence = [[self alloc] init];
    });
    return sharedInstence;    
}

- (id)init
{
    self = [super init];
    if (self) {
        _fontOffset = CGFLOAT_MAX;
    }
    return self;
}

- (CGFloat)fontOffset
{
    if (_fontOffset>1000000.0) {
        _fontOffset = [[NSUserDefaults standardUserDefaults] floatForKey:IMVThemeUserDefaultFontOffset];
    }
    return _fontOffset;
}

- (void)setFontOffset:(CGFloat)fontOffset
{
    if (_fontOffset != fontOffset) {
        _fontOffset = fontOffset;
        [[NSUserDefaults standardUserDefaults] setFloat:_fontOffset forKey:IMVThemeUserDefaultFontOffset];
    }
}

- (void)useTheme:(IMVTheme *)theme
{
    _theme = theme;
    self.fontOffset = 0.0;
    [[NSNotificationCenter defaultCenter] postNotificationName:IMVNotificationThemeChanged object:theme];
}

- (UIImage *)imageForName:(NSString *)name
{
    return [self.theme imageForName:name];
}

- (UIColor *)colorForName:(NSString *)name
{
    return [self.theme colorForName:name];
}

- (UIFont *)fontForName:(NSString *)name
{
    return [self.theme fontForName:name];
}

@end
