//
//  TabBarVC1.m
//  BaseNavController
//
//  Created by 郭海祥 on 2017/10/16.
//  Copyright © 2017年 guohx. All rights reserved.
//

#import "TabBarVC1.h"
#import "SamplePushVC.h"


@implementation TabBarVC1

#pragma mark- cycle life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initUI];
    [self initNav];

    self.hiddenNavBar = NO;

    self.navBarColor = [UIColor yellowColor];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- initUI
- (void)initUI {
    //按钮
    UIButton * go = [[UIButton alloc] initWithFrame:CGRectMake(0, 80, 100, 30)];
    [go addTarget:self action:@selector(goClick) forControlEvents:UIControlEventTouchUpInside];
    [go setTitle:@"goPush" forState:UIControlStateNormal];
    [go setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:go];
    
}
- (void)initNav {
    self.navigationItem.title= @"11 title";
//    self.hiddenLeftBtn = YES;
    self.backImage = [UIImage imageNamed:@"tab.png"];
//    self.navBarColor = [UIColor redColor];
    
    self.statusBarTextIsWhite = YES;
//    self.navBarTranslucent = YES;
    
}

#pragma mark- Event
- (void)goClick {

    SamplePushVC * vc = [[SamplePushVC alloc] init];
    [self pushRootNav:vc animated:YES];
}

#pragma mark- Setting Getting

@end
