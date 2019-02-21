//
//  YJXTagCell.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/21.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXTagCell.h"
#import "YJXTagM.h"
#import <SDWebImage/SDWebImage.h>

@interface YJXTagCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@end

@implementation YJXTagCell

#pragma mark - getter&&setter

- (void)setTagModel:(YJXTagM *)tagModel {
    _tagModel = tagModel;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:tagModel.header] placeholderImage:[UIImage imageNamed:@"default_avatar_big_80x80_"]];
    self.nameLabel.text = tagModel.screen_name;
    self.numLabel.text = [NSString stringWithFormat:@"%ld人已关注",tagModel.fans_count];
}

#pragma mark - 从xib中加载

- (void)awakeFromNib {
    self.iconImageView.layer.cornerRadius = 30;
    self.iconImageView.layer.masksToBounds = YES;
    [super awakeFromNib];
}

@end
