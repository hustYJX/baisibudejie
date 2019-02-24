//
//  UIView+YJXFromXib.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/23.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "UIView+YJXFromXib.h"

@implementation UIView (YJXFromXib)

#pragma mark - 从xib中加载UIView

+ (instancetype)loadViewFromXib {
    return [[[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:self options:nil] lastObject];
}

+ (instancetype)loadViewFromXibWithIndex:(NSInteger)index {
    return [[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:self options:nil][index];
}

@end
