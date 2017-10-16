//
//  TabBarVC2.m
//  BaseNavController
//
//  Created by 郭海祥 on 2017/10/16.
//  Copyright © 2017年 guohx. All rights reserved.
//

#import "TabBarVC2.h"

@implementation TabBarVC2
#pragma mark- cycle life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- initUI
- (void)initNav {
    
    self.navigationItem.title= @"22 title";
    self.hiddenLeftBtn = YES;
    self.navBarColor = [UIColor lightGrayColor];
    
    self.statusBarTextIsWhite = NO;
}
#pragma mark- Event

#pragma mark- Setting Getting
@end
