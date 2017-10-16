//
//  BaseNavgationController.m
//  TestProject
//
//  Created by Guohx on 16/5/24.
//
//

#import "BaseNavgationController.h"

@interface BaseNavgationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customNavBtnGesture];
  
}

- (void)customNavBtnGesture {
    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}

#pragma mark- 旋转
//当前视图是否 允许旋转 YES允许 NO不允许
- (BOOL)shouldAutorotate {
    return [self.visibleViewController shouldAutorotate];
}
//支持那些旋转方向（project设置的）
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.visibleViewController supportedInterfaceOrientations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
