//
//  YJXMeVC.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/18.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXMeVC.h"

@interface YJXMeVC ()

@end

@implementation YJXMeVC

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
}

#pragma mark - 设置导航条

- (void)setupNavigationBar {
    UIBarButtonItem *settingBtnitem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] highlightedImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(settingBtnClick)];
    UIBarButtonItem *nightBtnItem =  [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] selectedImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(nightBtnClick:)];
    self.navigationItem.rightBarButtonItems = @[settingBtnitem,nightBtnItem];
    self.navigationItem.title = @"我的";
}

#pragma mark - 监听设置按钮的点击

- (void)settingBtnClick {
    
}

#pragma mark - 监听月亮按钮的点击

- (void)nightBtnClick:(UIButton *)nightBtn {
    nightBtn.selected = !nightBtn.selected;
}

@end
