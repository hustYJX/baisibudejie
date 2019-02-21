//
//  YJXTagM.h
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/21.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TagType) {
    TagTypeJoke = 5,
    TagTypeHumor = 17,
    TagTypeLife = 43,
    TagTypeAnimation = 35,
    TagTypeMusic = 33
};

@interface YJXTagM : NSObject

@property (nonatomic, assign) NSInteger fans_count;
@property (nonatomic, strong) NSString *header;
@property (nonatomic, strong) NSString *screen_name;

@end

NS_ASSUME_NONNULL_END
