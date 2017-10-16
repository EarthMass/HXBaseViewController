//
//  UIButton+InBlock.h
//  osta
//
//  Created by howsur on 16/3/18.
//  Copyright © 2016年 com.howsur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UIButton+InBlock.h"
#import <objc/runtime.h>

typedef void (^ActionBlock)();

@interface UIButton (InBlock)

//外部只读
@property (readonly) NSMutableDictionary * event;

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;

@end
