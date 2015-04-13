//
//  ViewController.m
//  IMVTheme
//
//  Created by 陈少华 on 15/4/13.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import "ViewController.h"
#import "IMVThemeManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _imgView.image = [UIImage imageForName:@"default_user"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
