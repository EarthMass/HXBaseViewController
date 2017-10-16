//
//  OneVC.m
//  TestProject
//
//  Created by Guohx on 16/5/20.
//
//

#import "OneVC.h"
#import "UIButton+InBlock.h"
#import "TwoVC.h"


@interface OneVC ()

@end

@implementation OneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"到oneV到到oneV到到oneV到";
    self.canGesBack = YES;
//    self.backStr = @"返回";
//    self.hiddenStatusBar = YES;
    self.hiddenStatusBarWhenRotate = YES;
    self.canRotate = YES;
    self.canFullScreenGesBack = YES;
    
//    self.statusBarBackgroundColor = [UIColor redColor];
//    self.hiddenStatusBar  = YES;
    
    self.statusBarTextIsWhite = NO;
    self.navBarTranslucent = YES;
    self.statusBarBackgroundColor = [UIColor redColor];
    
//    self.leftBtnV = ({
//        UIView * cusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//        cusView.backgroundColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.420];
//        cusView;
//    });
    
    self.titleViewCenter = NO;
    
    self.rightBtnV = ({
        UIView * cusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 40)];
        cusView.backgroundColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.420];
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        btn.backgroundColor = [UIColor yellowColor];
        [btn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
            //
            NSLog(@"点击 自定义 rightBtnV");
            
        }];
        [cusView addSubview: btn];
        cusView;
    });
    
    [self cusRightBtnVWithImageArr:@[@"searchIcon.png",@"hisIcon.png"] clickBlock:^(NSInteger index) {
        NSLog(@"cusRightBtnVWithImageArr click is %ld",(long)index);
    }];
    
    self.titleV = ({
        UIView * cusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
        cusView.backgroundColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.420];
        cusView;
    });
 
    
    UIButton * btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 100, 40)];
    [btn1 setTitle:@"第一个导航栏" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor brownColor];
//    [btn1 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton * btn2 = [[UIButton alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 40 - 64, 100, 40)];
    [btn2 setTitle:@"第二个导航栏" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor brownColor];
    [btn2 addTarget:self action:@selector(btn2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
//    [self hiddenStatusBar:YES animation:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    
}
- (void)viewDidDisappear:(BOOL)animated {
    [self refreshNavSetting];
}

- (void)backBtnClick {
//    [super backBtnClick];

//    NSNumber * value = [NSNumber numberWithInt:UIDeviceOrientationUnknown];
//    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
     NSNumber * value1 = [NSNumber numberWithInt:UIDeviceOrientationPortrait];
     [[UIDevice currentDevice] setValue:value1 forKey:@"orientation"];
    
     [self.navigationController popViewControllerAnimated:YES];
}

- (void)btn2 {
    [self.navigationController pushViewController:[TwoVC new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- 导航栏透明
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    self.edgesForExtendedLayout = UIRectEdgeAll;
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
//}
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:nil];
//}


@end
