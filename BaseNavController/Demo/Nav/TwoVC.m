//
//  TwoVC.m
//  TestProject
//
//  Created by Guohx on 16/5/20.
//
//

#import "TwoVC.h"
#import "UIButton+InBlock.h"

#import "WithoutBarVC.h"

@interface TwoVC ()

@end

@implementation TwoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.title = @"到twoV";
    self.rightStr = @"地位饿";

//    [self setNavBarTranslucent:YES];

    self.canFullScreenGesBack = YES;
//    self.canGesBack = NO;
    self.navBarColor = [UIColor redColor];

    


    self.statusBarTextIsWhite = YES;
    
    self.titleV = ({
        UIView * cusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 600, 40)];
        cusView.backgroundColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.420];
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        btn.backgroundColor = [UIColor yellowColor];
        [btn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
            //
            NSLog(@"点击 自定义 rightBtnV");
            
        }];
        [cusView addSubview: btn];
        cusView;
    });

    UIView * tmpRed = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    tmpRed.backgroundColor = [UIColor redColor];
    [self.view addSubview:tmpRed];

    //按钮
    UIButton * go = [[UIButton alloc] initWithFrame:CGRectMake(0, 80, 120, 30)];
    [go addTarget:self action:@selector(goClick) forControlEvents:UIControlEventTouchUpInside];
    [go setTitle:@"goNoNav" forState:UIControlStateNormal];
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

    WithoutBarVC * vc = [[WithoutBarVC alloc] init];
    //    AppDelegate * app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //    [app.nav pushViewController:vc animated:YES];
    [self pushRootNav:vc animated:YES];
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
