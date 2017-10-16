//
//  NSString+GetImageFromBundle.m
//  BaseNavController
//
//  Created by Guohx on 16/7/27.
//  Copyright © 2016年 guohx. All rights reserved.
//

#import "NSString+GetImageFromBundle.h"

@implementation NSString (GetImageFromBundle)


+ (UIImage *)getImageOfImageName:(NSString *)imageName type:(BundleType)type {
    
    NSString * bundleName = nil;
    if (type == BaseNavController) {
        bundleName = @"HXBaseViewController.bundle";
    }
    
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:bundleName];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    NSString *img_path = [bundle pathForResource:imageName ofType:@"png"];
    return [UIImage imageWithContentsOfFile:img_path];
}

@end
