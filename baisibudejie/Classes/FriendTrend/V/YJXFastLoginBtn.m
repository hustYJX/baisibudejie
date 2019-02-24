//
//  YJXFastLoginBtn.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/24.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXFastLoginBtn.h"

@implementation YJXFastLoginBtn

#pragma mark - 布局按钮内部的子控件位置

- (void)layoutSubviews {
    [super layoutSubviews];
    /** 设置快速登录按钮内部图片的位置 */
    self.imageView.yjx_centerX = 0;
    self.imageView.yjx_centerX = self.yjx_width * 0.5;
    /** 设置快速登录按钮内部文字的位置 */
    self.titleLabel.yjx_y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.yjx_centerX = self.yjx_width * 0.5;
}

@end
