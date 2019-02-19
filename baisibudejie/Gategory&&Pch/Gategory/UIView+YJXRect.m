//
//  UIView+YJXRect.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/18.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "UIView+YJXRect.h"

@implementation UIView (YJXRect)

#pragma mark - x

- (CGFloat)yjx_x
{
    return self.frame.origin.x;
    
}

- (void)setYjx_x:(CGFloat)yjx_x
{
    CGRect rect = self.frame;
    rect.origin.x = yjx_x;
    self.frame = rect;
}

#pragma mark - y

- (CGFloat)yjx_y
{
    
    return self.frame.origin.y;
}

- (void)setYjx_y:(CGFloat)yjx_y
{
    CGRect rect = self.frame;
    rect.origin.y = yjx_y;
    self.frame = rect;
}

#pragma mark - height

- (CGFloat)yjx_height
{
    return self.frame.size.height;
}

- (void)setYjx_height:(CGFloat)yjx_height
{
    CGRect rect = self.frame;
    rect.size.height = yjx_height;
    self.frame = rect;
}

#pragma mark - width

- (CGFloat)yjx_width
{
    return self.frame.size.width;
}

- (void)setYjx_width:(CGFloat)yjx_width
{
    CGRect rect = self.frame;
    rect.size.width = yjx_width;
    self.frame = rect;
}

#pragma mark - centerX

- (CGFloat)yjx_centerX
{
    return self.center.x;
}

- (void)setYjx_centerX:(CGFloat)yjx_centerX
{
    CGPoint center = self.center;
    center.x = yjx_centerX;
    self.center = center;
}

#pragma mark - centerY

- (CGFloat)yjx_centerY
{
    return self.center.y;
}

- (void)setYjx_centerY:(CGFloat)yjx_centerY
{
    CGPoint center = self.center;
    center.y = yjx_centerY;
    self.center = center;
}

@end
