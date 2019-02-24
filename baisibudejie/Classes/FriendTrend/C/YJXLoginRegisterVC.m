//
//  YJXLoginRegisterVC.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/23.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXLoginRegisterVC.h"
#import "YJXLoginRegisterV.h"
#import "YJXFastLoginV.h"

@interface YJXLoginRegisterVC ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleTop;
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation YJXLoginRegisterVC

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMiddleView];
    [self setupBottomView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.middleView.subviews[0].frame = CGRectMake(0, 0, self.middleView.yjx_width * 0.5, self.middleView.yjx_height);
    self.middleView.subviews[1].frame = CGRectMake(self.middleView.yjx_width * 0.5, 0, self.middleView.yjx_width * 0.5, self.middleView.yjx_height);
    self.bottomView.subviews[0].frame = self.bottomView.bounds;
}

#pragma mark - 设置中间的view

- (void)setupMiddleView {
    YJXLoginRegisterV *loginView = [YJXLoginRegisterV loadViewFromXibWithIndex:0];
    [self.middleView addSubview:loginView];
    YJXLoginRegisterV *registerView = [YJXLoginRegisterV loadViewFromXibWithIndex:1];
    [self.middleView addSubview:registerView];
}

#pragma mark - 设置底部的view

- (void)setupBottomView {
    YJXFastLoginV *fastLoginView = [YJXFastLoginV loadViewFromXibWithIndex:0];
    [self.bottomView addSubview:fastLoginView];
}

#pragma mark - 监听退出按钮的点击

- (IBAction)exitBtnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 监听登陆注册按钮的点击

- (IBAction)loginRegisterBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.middleTop.constant = ((self.middleView.yjx_x == 0)?-self.middleView.yjx_width *0.5:0);
}

@end
