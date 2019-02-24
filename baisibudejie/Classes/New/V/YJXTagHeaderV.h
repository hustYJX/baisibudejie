//
//  YJXTagHeaderV.h
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/21.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class YJXTagHeaderV;
@protocol TagHeaderViewDelegate <NSObject>

- (void)tagHeaderView:(YJXTagHeaderV *)tagHeaderView clickedBtn:(UIButton *)clickedBtn;

@end

@interface YJXTagHeaderV : UIView

@property (nonatomic, weak) id<TagHeaderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
