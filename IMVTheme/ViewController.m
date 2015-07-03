//
//  ViewController.m
//  IMVTheme
//
//  Created by 陈少华 on 15/4/13.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import "ViewController.h"
#import "IMVThemeManager.h"
#import "UIImage+IMVTheme.h"
#import "UIFont+IMVTheme.h"
#import "UIColor+IMVTheme.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
- (IBAction)theme1Clicked:(id)sender;
- (IBAction)theme2Clicked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setTheme];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTheme) name:IMVNotificationThemeChanged object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setTheme
{
    _imgView.image = [UIImage imageForName:@"/default_user"];
    _label.font = [UIFont fontForName:@"textTitleFont"];
    _label.textColor = [UIColor colorForName:@"textTitleColor"];
}
- (IBAction)theme1Clicked:(id)sender {
    
    [[IMVThemeManager sharedInstence] useTheme:[IMVTheme themeWithBundleName:@"ThemeDefault"]];
}

- (IBAction)theme2Clicked:(id)sender {
    [[IMVThemeManager sharedInstence] useTheme:[IMVTheme themeWithBundleName:@"ThemeDefault2"]];
}
@end
