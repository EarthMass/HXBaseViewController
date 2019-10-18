//
//  SamplePushVC.m
//  BaseNavController
//
//  Created by 郭海祥 on 2017/10/16.
//  Copyright © 2017年 guohx. All rights reserved.
//

#import "SamplePushVC.h"
#import "TwoVC.h"

@implementation SamplePushVC
#pragma mark- cycle life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title= @" title";

    self.hiddenNavBar = NO;
    self.statusBarTextIsWhite = NO;

    self.navBgImage = [UIImage imageNamed:@"bgNavImage.jpg"];
    self.navShadowImage = [UIImage imageNamed:@"bgNavImage.jpg"];

    //按钮
    UIButton * go = [[UIButton alloc] initWithFrame:CGRectMake(0, 80, 50, 30)];
    [go addTarget:self action:@selector(goClick) forControlEvents:UIControlEventTouchUpInside];
    [go setTitle:@"go" forState:UIControlStateNormal];
    [go setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:go];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- initUI

#pragma mark- Event
- (void)goClick {

    TwoVC * vc = [[TwoVC alloc] init];
    //    AppDelegate * app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //    [app.nav pushViewController:vc animated:YES];
    [self pushRootNav:vc animated:YES];
}
#pragma mark- Setting Getting
@end
