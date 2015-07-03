//
//  IMVStyle.m
//  IMVTheme
//
//  Created by 陈少华 on 15/4/10.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//
#import <IMVLogger.h>

#import "IMVStyle.h"
#import "IMVThemeManager.h"

@interface IMVStyle ()

@property (strong, nonatomic) UIColor *colorValue;
@property (strong, nonatomic) UIFont *fontValue;

@end

@implementation IMVStyle

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:[NSNumber numberWithInteger:self.type] forKey:@"type"];
    [dic setObject:self.value?self.value:@"" forKey:@"value"];
     
    return dic;
}

- (UIFont *)fontValue
{
    if (self.type != styleTypeFont) {
        NSLogWarn(@"%@ is not font style", _name);
        return nil;
    }
    if (!_fontValue) {
        //support zoom in or zoom out the text
        _fontValue = [UIFont systemFontOfSize:[self.value floatValue]+[IMVThemeManager sharedInstence].fontOffset];
    }
    return _fontValue;
}

- (UIColor *)colorValue
{
    if (self.type != styleTypeColor) {
        NSLogWarn(@"warm: not color style");
        return nil;
    }
    
    if (!_colorValue) {
        NSArray *rgb = [[self.value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsSeparatedByString:@","];
        if (rgb.count != 4) {
            NSLogError(@"error: color style format should be [r,g,b,alpha]");
            return nil;
        }
        _colorValue = [UIColor colorWithRed:[rgb[0] floatValue]/255 green:[rgb[1] floatValue]/255 blue:[rgb[2] floatValue]/255 alpha:[rgb[3] floatValue]];
    }
    
    return _colorValue;
}

@end
