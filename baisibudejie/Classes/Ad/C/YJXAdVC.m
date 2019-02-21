//
//  YJXAdVC.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/20.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXAdVC.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <SDWebImage.h>
#import "YJXAdM.h"
#import "YJXTabBarC.h"

@interface YJXAdVC ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *adContainView;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;
@property (nonatomic, weak) UIImageView *adImageView;
@property (nonatomic, strong) YJXAdM *adModel;
@property (nonatomic, weak) NSTimer *timer;

@end

#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@implementation YJXAdVC

#pragma mark - setter&&getter

- (UIImageView *)adImageView {
    if(_adImageView == nil) {
        UIImageView *adImageView = [[UIImageView alloc] init];
        adImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapAd = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAd)];
        [adImageView addGestureRecognizer:tapAd];
        [self.adContainView addSubview:adImageView];
        _adImageView = adImageView;
    }
    return _adImageView;
}

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    self.jumpBtn.layer.cornerRadius = 8;
    self.jumpBtn.layer.masksToBounds = YES;
    [self setupLaunchImage];
    [self loadAdData];
    
}

#pragma mark - 设置启动图片
/**
 568 se
 667 6s/7/8
 736 6sp/7p/8p
 812 x/xs
 896 xr/xs max
 */
- (void)setupLaunchImage {
    if(screenH == 568) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-568"];
    } else if(screenH == 667) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-667"];
    } else if(screenH == 736) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-736"];
    } else {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-812"];
    }
}

#pragma mark - 加载广告数据

- (void)loadAdData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
    [manager GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *adDict = [responseObject[@"ad"] firstObject];
        self.adModel = [YJXAdM mj_objectWithKeyValues:adDict];
        /** 保持图片比例不变 */
        if(self.adModel.w != 0) {
            self.adImageView.frame = CGRectMake(0, 0, screenW, screenW * self.adModel.h / self.adModel.w);
        }
        [self.adImageView sd_setImageWithURL:[NSURL URLWithString:self.adModel.w_picurl]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - 监听广告图片的点击

- (void)tapAd {
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:self.adModel.ori_curl];
    if([app canOpenURL:url]) {
        [app openURL:url options:[NSDictionary dictionary] completionHandler:nil];
    }
}

#pragma mark - 监听定时器事件

- (void)timeChange {
    static NSInteger i = 3;
    if(i == 0) {
        [self jumpBtnClick:nil];
    }
    [self.jumpBtn setTitle:[NSString stringWithFormat:@"跳过 %ld",i] forState:UIControlStateNormal];
    i --;
}

#pragma mark - 监听跳过按钮的点击

- (IBAction)jumpBtnClick:(UIButton *)sender {
    [UIApplication sharedApplication].keyWindow.rootViewController = [[YJXTabBarC alloc] init];
    [self.timer invalidate];
}
@end
