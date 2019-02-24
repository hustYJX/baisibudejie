//
//  YJXTagHeaderV.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/21.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXTagHeaderV.h"

@interface YJXTagHeaderV ()

@property (nonatomic, weak) UIButton *selectedBtn;
@property (weak, nonatomic) IBOutlet UIButton *jokeBtn;

@end

@implementation YJXTagHeaderV

#pragma mark - 从xib中加载

- (void)awakeFromNib {
    [super awakeFromNib];
    [self tagBtnClick:self.jokeBtn];
}

#pragma mark - getter&&setter

- (UIButton *)selectedBtn {
    if(_selectedBtn == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        _selectedBtn = btn;
    }
    return _selectedBtn;
}

#pragma mark - 监听标签按钮的点击

- (IBAction)tagBtnClick:(UIButton *)tagBtn {
    self.selectedBtn.selected = NO;
    self.selectedBtn.backgroundColor = UIColor.redColor;
    tagBtn.selected = YES;
    tagBtn.backgroundColor = kThemeRedColor;
    self.selectedBtn = tagBtn;
    [self.delegate tagHeaderView:self clickedBtn:tagBtn];
}

@end
