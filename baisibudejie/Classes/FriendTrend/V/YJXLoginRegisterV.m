//
//  YJXLoginRegisterV.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/23.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXLoginRegisterV.h"

@interface YJXLoginRegisterV ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation YJXLoginRegisterV

#pragma mark - 从xib中加载view

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.loginBtn.currentBackgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch];
    self.loginBtn.layer.cornerRadius = 10.0f;
    self.loginBtn.layer.masksToBounds = YES;
    [self.registerBtn.currentBackgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch];
    self.registerBtn.layer.cornerRadius = 10.0f;
    self.registerBtn.layer.masksToBounds = YES;
}


@end
