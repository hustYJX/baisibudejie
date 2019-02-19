//
//  YJXEssenceVC.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/18.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXEssenceVC.h"

@interface YJXEssenceVC ()

@end

@implementation YJXEssenceVC

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kThemeRedColor;
    [self setupNavigationBar];
}

#pragma mark - 设置导航条

- (void)setupNavigationBar {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_icon"] highlightedImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(gameBtnClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandom"] highlightedImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(randomBtnClick)];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

#pragma mark - 监听游戏按钮点击

- (void)gameBtnClick {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = UIColor.blueColor;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 监听随机按钮的点击

- (void)randomBtnClick {
    
}

@end
