//
//  UIView+YJXFromXib.h
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/23.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YJXFromXib)

+ (instancetype)loadViewFromXib;
+ (instancetype)loadViewFromXibWithIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
