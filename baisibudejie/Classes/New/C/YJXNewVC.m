//
//  YJXNewVC.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/18.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXNewVC.h"
#import "YJXTagTableVC.h"

@interface YJXNewVC ()

@end

@implementation YJXNewVC

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kThemeRedColor;
    [self setupNavigationBar];
}

#pragma mark - 设置导航条
- (void)setupNavigationBar {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highlightedImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(tagBtnClick)];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

#pragma mark - 监听标题按钮的点击

- (void)tagBtnClick {
    YJXTagTableVC *tagVc = [[YJXTagTableVC alloc] init];
    [self.navigationController pushViewController:tagVc animated:YES];
}

@end
