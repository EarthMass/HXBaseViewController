//
//  WithBarV.m
//  BaseNavController
//
//  Created by Guohx on 2017/3/6.
//  Copyright © 2017年 guohx. All rights reserved.
//

#import "WithoutBarVC.h"

@interface WithoutBarVC ()

@end

@implementation WithoutBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];

    self.hiddenNavBar = YES;
    
    
    UIButton * btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 100, 40)];
    [btn1 setTitle:@"next" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor brownColor];
    [btn1 addTarget:self action:@selector(btn1Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btn1Action {
    [self.navigationController pushViewController:[WithoutBarVC new] animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
