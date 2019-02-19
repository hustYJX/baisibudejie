//
//  YJXTabBar.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/18.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXTabBar.h"

@interface YJXTabBar ()

@property (nonatomic, weak) UIButton *publishBtn;

@end

@implementation YJXTabBar

#pragma mark - getter&&setter

- (UIButton *)publishBtn {
    if(_publishBtn == nil) {
        UIButton *publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon_49x49_"] forState:UIControlStateHighlighted];
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon_49x49_"] forState:UIControlStateNormal];
        [publishBtn sizeToFit];
        _publishBtn = publishBtn;
        [self addSubview:publishBtn];
    }
    return _publishBtn;
}

#pragma mark - 生命周期

- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger count = self.items.count + 1;
    NSInteger i = 0;
    CGFloat btnW = self.yjx_width / count;
    CGFloat btnX = 0;
    for (UIView *tabBarButton in self.subviews) {
        if([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if(i == 2) {
                i ++;
            }
            btnX = i * btnW;
            tabBarButton.frame = CGRectMake(btnX, 0, btnW, self.yjx_height);
            i ++;
        }
    }
    self.publishBtn.center = CGPointMake(self.yjx_width * 0.5, self.yjx_height * 0.5);
}

@end
