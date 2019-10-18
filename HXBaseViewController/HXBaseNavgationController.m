//
//  HXBaseNavgationController.m
//  TestProject
//
//  Created by Guohx on 16/5/24.
//
//

#import "HXBaseNavgationController.h"
#import "HXBaseViewController.h"

#if __has_include("UINavigationController+FDFullscreenPopGesture.h")
#import "UINavigationController+FDFullscreenPopGesture.h"
#endif

@interface HXBaseNavgationController ()
<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation HXBaseNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;

#if __has_include("UINavigationController+FDFullscreenPopGesture.h")
    self.fd_viewControllerBasedNavigationBarAppearanceEnabled = NO;
#endif
    [self customNavBtnGesture];

}

- (void)fd_setupViewControllerBasedNavigationBarAppearanceIfNeeded:(UIViewController *)appearingViewController
{
//    NSLog(@"FDFullscreenPopGesture重新方法避免导航栏状态被修改");
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

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if ([viewController isKindOfClass:[UITabBarController class]]) {

        [self setNavigationBarHidden:YES animated:YES];
    }
   
    if ([viewController isKindOfClass:[HXBaseViewController class]]) {

        [viewController.navigationController setNavigationBarHidden:((HXBaseViewController *)viewController).hiddenNavBar animated:YES];
    }




}



@end
