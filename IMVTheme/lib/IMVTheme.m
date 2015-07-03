//
//  IMVTheme.m
//  IMVCommon
//
//  Created by 陈少华 on 15/4/10.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//
#import <IMVLogger.h>

#import "IMVTheme.h"
#import "IMVStyle.h"


@interface IMVTheme ()

@property (strong, nonatomic) NSString *plistPath;

@end

@implementation IMVTheme

- (id)init
{
    self = [super init];
    if (self) {
        _styles = [NSMutableDictionary dictionary];
    }
    return self;
}

+ (IMVTheme *)themeWithBundleName:(NSString *)bundleName
{
    NSBundle *themeBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"]];
    IMVTheme *theme = [[IMVTheme alloc] init];
    theme.bundle = themeBundle;
    return theme;
}

+ (IMVTheme *)themeWithPath:(NSString *)path
{
    IMVTheme *theme = [[IMVTheme alloc] init];
    theme.path = path;
    return theme;
}

#pragma mark - getter setter
- (void)setBundle:(NSBundle *)bundle
{
    NSString *plistPath = [bundle pathForResource:@"theme" ofType:@"plist"];
    if (!plistPath || plistPath.length<=0) {
        NSLogError(@"theme plist not found in bundle:%@", bundle.bundlePath);
        return;
    }
    _bundle = bundle;
    _plistPath = plistPath;
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:_plistPath];
    for (NSString *key in dic.allKeys) {
        NSDictionary *value = dic[key];
        IMVStyle *style = [[IMVStyle alloc] initWithDictionary:value];
        style.name = key;
        [_styles setObject:style forKey:key];
    }
}

- (void)setPath:(NSString *)path
{
    NSString *plistPath = [path stringByAppendingPathComponent:@"theme.plist"];
    if (!plistPath || plistPath.length<=0) {
        NSLogError(@"theme plist not found at path:%@", path);
        return;
    }
    _path = path;
    _plistPath = plistPath;
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:_plistPath];
    for (NSString *key in dic.allKeys) {
        NSDictionary *value = dic[key];
        IMVStyle *style = [[IMVStyle alloc] initWithDictionary:value];
        [_styles setObject:style forKey:key];
    }
}




#pragma mark public method
- (NSDictionary *)dictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (NSString *key in self.styles.allKeys) {
        IMVStyle *style = self.styles[key];
        [dic setObject:[style dictionary] forKey:key];
    }
    return dic;
}

- (BOOL)synchronize
{
    if (!self.plistPath) {
        return NO;
    }
    return [[self dictionary] writeToFile:self.plistPath atomically:YES];
}

- (UIImage *)imageForName:(NSString *)name
{
    NSString *imgPath = nil;
    NSInteger scale = [UIScreen mainScreen].scale;
    
    //if current scal=3, search for 3x first, if not found, search for 2x ...
    if (_path) {
        while (scale>1) {
            NSString *tempPath = [_path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@@%lix.png", name, (long)scale]];
            if ([[NSFileManager defaultManager] fileExistsAtPath:tempPath]) {
                imgPath = tempPath;
                break;
            }
            scale--;
        }
    }
    if (_bundle) {
        while (scale>0) {
            NSString *tempPath = [_bundle pathForResource:[NSString stringWithFormat:@"%@@%lix", name, (long)scale] ofType:@"png"];
            if ([[NSFileManager defaultManager] fileExistsAtPath:tempPath]) {
                imgPath = tempPath;
                break;
            }
            scale--;
        }
    }
    
    if (!imgPath) {
        NSLogWarn(@"the image name:%@ not found", name);
        return nil;
    }
    return [UIImage imageWithContentsOfFile:imgPath];
}

- (UIColor *)colorForName:(NSString *)name
{
    IMVStyle *style = [self.styles objectForKey:name];
    if (!style) {
        NSLogWarn(@"the color named:%@ not found", name);
        return nil;
    }
    return style.colorValue;
}

- (UIFont *)fontForName:(NSString *)name
{
    IMVStyle *style = [self.styles objectForKey:name];
    if (!style) {
        NSLogError(@"the font named:%@ not found", name);
        return nil;
    }
    return style.fontValue;
}

@end
