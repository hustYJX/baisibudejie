//
//  YJXTabBarController.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/17.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXTabBarC.h"
#import "YJXNavigationC.h"
#import "YJXEssenceVC.h"
#import "YJXNewVC.h"
#import "YJXPublishVC.h"
#import "YJXFriendTrendVC.h"
#import "YJXMeVC.h"
#import "YJXTabBar.h"

@interface YJXTabBarC ()

/** 记录上次选中的tabBarItem的索引 */
@property (nonatomic,assign) NSInteger indexFlag;

@end

@implementation YJXTabBarC

#pragma mark - 生命周期

+ (void)load {
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    /** 在普通状态下设置文字的大小 */
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    /** 在选中状态下设置文字的颜色 */
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = kThemeRedColor;
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.indexFlag = 0;
    [self setupTabBar];
    [self setupAllChildVcs];
    [self setupTabBarButtons];
}

#pragma mark - 自定义tabBar

- (void)setupTabBar {
    YJXTabBar *tabBar = [[YJXTabBar alloc] init];
    [tabBar setTranslucent:NO]; /** 设置tabBar不透明 */
    [self setValue:tabBar forKeyPath:@"tabBar"];
}

#pragma mark - 设置子控制器

- (void)setupAllChildVcs {
    /** 1.精华 */
    YJXNavigationC *essenceNav = [[YJXNavigationC alloc] initWithRootViewController:[[YJXEssenceVC alloc] init]];
    /** 2.新帖 */
    YJXNavigationC *newNav = [[YJXNavigationC alloc] initWithRootViewController:[[YJXNewVC alloc] init]];
    /** 3.关注 */
    YJXNavigationC *friendTrendNav = [[YJXNavigationC alloc] initWithRootViewController:[[YJXFriendTrendVC alloc] init]];
    /** 4.我 */
    YJXNavigationC *meNav = [[YJXNavigationC alloc] initWithRootViewController:[[YJXMeVC alloc] init]];
    
    self.viewControllers = @[essenceNav, newNav, friendTrendNav, meNav];
}

#pragma mark - 设置setupTabBarButtons

- (void)setupTabBarButtons {
    /** 设置图片 */
    NSArray *imageNames = @[@"tabBar_essence_icon_27x27_", @"tabBar_new_icon_27x27_", @"tabBar_friendTrends_icon_27x27_", @"tabBar_me_icon_27x27_"];
    NSArray *selectedImageNames = @[@"tabBar_essence_click_icon_27x27_", @"tabBar_new_click_icon_27x27_", @"tabBar_friendTrends_click_icon_27x27_", @"tabBar_me_click_icon_27x27_"];
    [self setupTabBarButtonImagesWithImageNames:imageNames selectedImageNames:selectedImageNames];
    /** 设置标题 */
    NSArray *titles = @[@"精华", @"新帖", @"关注", @"我的"];
    [self setupTabBarButtonTitles:titles];
}

- (void)setupTabBarButtonImagesWithImageNames:(NSArray <NSString *>*)imageNames selectedImageNames:(NSArray<NSString *> *)selectedImageNames {
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        item.image = [[UIImage imageNamed:imageNames[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:selectedImageNames[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }];
}

- (void)setupTabBarButtonTitles:(NSArray<NSString *> *)titles {
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        item.title = titles[idx];
    }];
}

#pragma mark - 选中tabBar调用

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (index != self.indexFlag) {
        NSMutableArray *array = [NSMutableArray array];
        for (UIView *btn in self.tabBar.subviews) {
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [array addObject:btn];
            }
        }
        /** 缩放动画 */
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        /** 速度控制函数，控制动画运行的节奏 */
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.duration = 0.2;
        animation.repeatCount = 1;
        animation.removedOnCompletion = YES;
        animation.fromValue = [NSNumber numberWithFloat:1]; /** 初始伸缩倍数 */
        animation.toValue = [NSNumber numberWithFloat:1.2]; /** 结束伸缩倍数 */
        [[array[index] layer] addAnimation:animation forKey:nil];
        self.indexFlag = index;
    }
}

@end
