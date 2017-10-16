//
//  NSString+GetImageFromBundle.h
//  BaseNavController
//
//  Created by Guohx on 16/7/27.
//  Copyright © 2016年 guohx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    BaseNavController = 0,
} BundleType;

/**
 * 获取图片 从bundle中获取
 */
@interface NSString (GetImageFromBundle)

+ (UIImage *)getImageOfImageName:(NSString *)imageName type:(BundleType)type;

@end
