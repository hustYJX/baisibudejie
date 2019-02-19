//
//  UIBarButtonItem+YJXItem.h
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/19.
//  Copyright © 2019 尤建峡. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (YJXItem)

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
