//
//  YJXNavigationC.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/18.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXNavigationC.h"

@interface YJXNavigationC ()<UIGestureRecognizerDelegate>

@end

@implementation YJXNavigationC

#pragma mark - 生命周期

+ (void)load {
    /** 统一设置导航条标题文字大小 */
    UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [navigationBar setTitleTextAttributes:attrs];
    /** 统一设置导航条不透明 */
    [navigationBar setTranslucent:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self totalScreenBack];
}

#pragma mark - 全屏滑动返回功能

- (void)totalScreenBack {
    UIPanGestureRecognizer *backPan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:backPan];
    backPan.delegate = self;
    self.interactivePopGestureRecognizer.enabled = NO;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return self.viewControllers.count > 1;
}

#pragma mark - push时调用

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if(self.viewControllers.count > 0) {
        /** 统一设置返回按钮 */
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] highlightedImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) title:@"返回"];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 监听返回按钮点击

- (void)back {
    [self popViewControllerAnimated:YES];
}
@end
