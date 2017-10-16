//
//  UIButton+InBlock.m
//  osta
//
//  Created by howsur on 16/3/18.
//  Copyright © 2016年 com.howsur. All rights reserved.
//
#import "UIButton+InBlock.h"

@implementation UIButton (InBlock)

static char overviewKey;

@dynamic event; ///< @dynamic 不自动生成getter setter方法

- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block {
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}


- (void)callActionBlock:(id)sender {
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block();
    }
}


@end
