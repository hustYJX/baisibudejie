//
//  YJXFriendTrendVC.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/18.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXFriendTrendVC.h"

@interface YJXFriendTrendVC ()

@end

@implementation YJXFriendTrendVC

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
}

#pragma mark - 设置导航条

- (void)setupNavigationBar {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] highlightedImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(friendsRecommentBtnClick)];
    self.navigationItem.title = @"我的关注";
}

#pragma mark - 监听推荐按钮的点击

- (void)friendsRecommentBtnClick {
    
}

@end
