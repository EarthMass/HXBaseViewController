//
//  HXBaseViewController.m
//  TestProject
//
//  Created by Guohx on 16/5/20.
//
//

#import "HXBaseViewController.h"
#import "NSString+GetImageFromBundle.h"

#if __has_include("UINavigationController+FDFullscreenPopGesture.h")
#import "UINavigationController+FDFullscreenPopGesture.h"
#endif

#if __has_include(<UINavigation-SXFixSpace/UINavigationSXFixSpace.h>)
#import <UINavigation-SXFixSpace/UINavigationSXFixSpace.h>
#endif






@interface HXBaseViewController () {
    UINavigationBar * navBar;
    BOOL isVcBaseApper; ///< 导航的设置优先级
    
    UIButton * leftBtn;
}

@property (nonatomic, copy) GCusNavClickIndex cusNavClickIndex;
/**
 *  左右 按钮的宽度
 */
@property (nonatomic, assign) CGFloat cusRightBtnW;
@property (nonatomic, assign) CGFloat cusLeftBtnW;



@end

@implementation HXBaseViewController

+ (void)load {

//导航栏按钮位置偏移的解决方案,兼容iOS7~iOS13,可自定义间距
#if __has_include(<UINavigation-SXFixSpace/UINavigationSXFixSpace.h>)
    [UINavigationConfig shared].sx_disableFixSpace = NO;//是否禁止使用修正,默认为NO
    [UINavigationConfig shared].sx_defaultFixSpace = 10;//默认为0 可以修改 ios11+ 距离边缘的间距

#endif


}

#pragma mark- Cycle Life
- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].keyWindow.backgroundColor = GBackGroundColor;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = GBackGroundColor;

    
    
    navBar = self.navigationController.navigationBar;
    
    //#pragma mark- 判断 导航的设置优先级 为 控制器 否则有些设置会无效
    
     NSNumber * isVCBasedStatusBarAppearance = [[NSBundle mainBundle]objectForInfoDictionaryKey:@"UIViewControllerBasedStatusBarAppearance"];
    
//    BOOL isVCBasedStatusBarAppearance = [[[NSBundle mainBundle]objectForInfoDictionaryKey:@"UIViewControllerBasedStatusBarAppearance"] boolValue];
    //    NSAssert(isVCBasedStatusBarAppearance, @"*******BaseNavViewController已VC作为根视图 \n请在Info.plist中设置UIViewControllerBasedStatusBarAppearance 为YES---\n否则以AppDelegate中的设置为准，或通过[UIApplication sharedApplication] setStatusBarHidden*******");
    if (isVCBasedStatusBarAppearance != nil) {
        isVcBaseApper = ([isVCBasedStatusBarAppearance boolValue])?YES:NO;
    } else {
        isVcBaseApper = YES;
    }
    
    [self setOther];
    
    [self setNavInit];
    
    

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (_canRotate) {
        UIInterfaceOrientation interfaceOrientation = (UIInterfaceOrientation)[UIDevice currentDevice].orientation;
        if (interfaceOrientation != UIInterfaceOrientationPortrait && interfaceOrientation != UIInterfaceOrientationUnknown) {
            
            [self hiddenStatusBarOperate:_hiddenStatusBarWhenRotate];
            
        } else {
            
            [self hiddenStatusBarOperate:_hiddenStatusBar];
            
            
        }
    }



    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = self.canGesBack;
    }
#if __has_include("UINavigationController+FDFullscreenPopGesture.h")
    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = _canFullScreenGesBack;
#endif


    if (_hiddenNavBar != !self.navigationController.navigationBar.hidden) {
        if (_hiddenNavBar) {
            [self.navigationController setNavigationBarHidden:_hiddenNavBar animated:NO];
        } else {
            [self.navigationController setNavigationBarHidden:_hiddenNavBar animated:NO];
        }
    }




}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self updateNavigationBarAppearance];
}

- (void)updateNavigationBarAppearance {
    NSLog(@"");
    UIColor * statuBarColor = [_statusBarBackgroundColor copy];
    self.statusBarBackgroundColor = statuBarColor;
    //导航栏 字体 字色 背景色
    [navBar
     setTitleTextAttributes:
     navBar.titleTextAttributes];
    //导航背景颜色
    UIColor * navBarColor = [_navBarColor copy];
    self.navBarColor = navBarColor;

    self.navBarTranslucent = _navBarTranslucent;
    //状态栏设置
    self.hiddenStatusBar = _hiddenStatusBar;

    //状态栏 字体颜色 黑色/白色 默认白色
    self.statusBarTextIsWhite = _statusBarTextIsWhite;
    //导航透明 YES 透明
    self.navBarTranslucent = _navBarTranslucent;

    self.navBgImage = _navBgImage;

    self.navShadowImage = _navShadowImage;
}

#pragma mark- Init Setting
- (void)setOther {
    
    self.canFullScreenGesBack = YES;
    self.canGesBack = YES;
    self.canRotate = NO;
    self.titleViewCenter = YES;
    self.hiddenStatusBarWhenRotate = YES;
    self.hiddenNavBar = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;



}

/**
 *  初始化导航界面
 */
- (void)setNavInit {
    /** [UINavigationBar appearance];
     *  请注意＊使用appearance设置UI效果最好采用全局的设置，在所有界面初始化前开始设置，否则可能失效。
     */
    self.statusBarBackgroundColor = GNavBgColor;
    
    //导航栏 字体 字色 背景色
    [navBar
     setTitleTextAttributes:
     @{
       NSForegroundColorAttributeName:GNavTextColor,
       NSFontAttributeName:GNavTextFont,
       }];
    //导航背景颜色
    self.navBarColor = GNavBgColor;
    
    self.navBarTranslucent = YES;
    
    //状态栏设置
    self.hiddenStatusBar = NO;
    
    //状态栏 字体颜色 黑色/白色 默认白色
    self.statusBarTextIsWhite = YES;
    //导航透明 YES 透明
    self.navBarTranslucent = NO;
    //导航按钮初始化
    [self navBtnInit];
    
}


- (void)navBtnInit {
    
    //导航左按钮
    leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    
    [leftBtn setImage:[NSString getImageOfImageName:GNavBackImageName type:BaseNavController] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [leftBtn sizeToFit];
    
    self.cusLeftBtnW = leftBtn.bounds.size.width;
    
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftButton;
    
}

#pragma mark- 刷新当前页面 导航控制器 配置
- (void)refreshNavSetting {
    [self setOther];
    [self setNavInit];
}

#pragma mark- 隐藏状态栏 设置状态栏风格
- (void)setHiddenStatusBarWhenRotate:(BOOL)hiddenStatusBarWhenRotate {
    _hiddenStatusBarWhenRotate = hiddenStatusBarWhenRotate;
}

- (void)setHiddenStatusBar:(BOOL)hidden {
    
    //    if (!hidden) {
    //        return;
    //    }
    _hiddenStatusBar = hidden;
    [self hiddenStatusBarOperate:_hiddenStatusBar];
}

- (void)hiddenStatusBarOperate:(BOOL)hiddenStatusBar {
    _hiddenStatusBar = hiddenStatusBar;
    if (!isVcBaseApper) {
        [[UIApplication sharedApplication] setStatusBarHidden:hiddenStatusBar];
    } else {
        
        //prefersStatusBarHidden
        
        if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
            
            [self prefersStatusBarHidden];
            
            [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
            
        }
    }
}

- (BOOL)prefersStatusBarHidden
{
    UIInterfaceOrientation interfaceOrientation = (UIInterfaceOrientation)[UIDevice currentDevice].orientation;
    if (interfaceOrientation != UIInterfaceOrientationPortrait && interfaceOrientation != UIInterfaceOrientationUnknown) {
        return _hiddenStatusBarWhenRotate;
    } else {
        return _hiddenStatusBar;
    }
    
}
////设置状态栏 风格 VC 不管理，属于UINavigationController管理【不调用】
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}


- (void)setStatusBarTextIsWhite:(BOOL)isWhite {

    _statusBarTextIsWhite = isWhite;
    if (!isVcBaseApper) {
        [[UIApplication sharedApplication] setStatusBarStyle:(isWhite)?UIStatusBarStyleLightContent:UIStatusBarStyleDefault];
    } else {
        [navBar setBarStyle:(isWhite)?UIBarStyleBlack:UIBarStyleDefault];
    }
    
    
}

//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    _statusBarBackgroundColor = color;
    UIView *statusBar = nil;

#if defined(__IPHONE_13_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_13_0
    if(@available(iOS 13.0,*))
    {
        UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].keyWindow.windowScene.statusBarManager;
        if ([statusBarManager respondsToSelector:@selector(createLocalStatusBar)]) {
            UIView *_localStatusBar = [statusBarManager performSelector:@selector(createLocalStatusBar)];
            if ([_localStatusBar respondsToSelector:@selector(statusBar)]) {
                statusBar = [_localStatusBar performSelector:@selector(statusBar)];
            }
        }
    }
#else
         statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
#endif

    NSLog(@"statusBar.backgroundColor--->%@",statusBar.backgroundColor);
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

#pragma mark- 导航栏颜色 透明否
- (void)setNavBarColor:(UIColor *)navColor {
    _navBarColor = navColor;
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] <7.0) {
        
        [navBar setTintColor:navColor];
        
    }else
    {
        [navBar setBarTintColor:navColor];
    }
    _navBarColor = navColor;
}
- (void)setNavBarTranslucent:(BOOL)translucent {
    _navBarTranslucent = translucent;
    navBar.translucent = translucent;
    if (translucent) {
        self.edgesForExtendedLayout = UIRectEdgeTop;
        
        //设置导航栏背景图片为一个空的image，这样就透明了
        [navBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        
        //去掉透明后导航栏下边的黑边
        [navBar setShadowImage:[[UIImage alloc] init]];
//        navBar.layer.masksToBounds = YES;// 去掉横线（没有这一行代码导航栏的最下面还会有一个横线）
        
    }
    else {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        //    如果不想让其他页面的导航栏变为透明 需要重置
        [navBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [navBar setShadowImage:nil];
        
    }
    

}

#pragma mark- 属性设置
- (void)setHiddenLeftBtn:(BOOL)hiddenLeftBtn {
    //    leftBarButtonItem
    _hiddenLeftBtn = hiddenLeftBtn;
    self.navigationItem.leftBarButtonItem = nil;
}

//手势 返回 开关
- (void)setCanGesBack:(BOOL)canGesBack {
    _canGesBack = canGesBack;
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = _canGesBack;
    }   
}

- (void)setCanFullScreenGesBack:(BOOL)canFullScreenGesBack {
    _canFullScreenGesBack = canFullScreenGesBack;
#if __has_include("UINavigationController+FDFullscreenPopGesture.h")
self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = canFullScreenGesBack;
#endif


}


- (void)setCanRotate:(BOOL)canRotate {
    _canRotate = canRotate;
}

- (void)setTitleViewCenter:(BOOL)titleViewCenter {
    
    _titleViewCenter = titleViewCenter;
    if (!_titleV) {
        return;
    }
    [self setTitleV:_titleV];
}

- (void)setHiddenNavBar:(BOOL)hiddenNavBar {
    _hiddenNavBar = hiddenNavBar;
}

#pragma mark- 文字标题

- (void)setRightStr:(NSString *)rightStr {
    
    //导航左按钮
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [rightBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 0, 5, 15)];
    
    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:rightStr forState:UIControlStateNormal];
    [rightBtn setTitleColor:GNavBtnTitleColorNormal forState:UIControlStateNormal];
    [rightBtn setTitleColor:GNavBtnTitleColorSelect forState:UIControlStateHighlighted];
    rightBtn.titleLabel.font = GNavBtnTitleFont;
    
    [rightBtn sizeToFit];
    
    self.cusRightBtnW = rightBtn.bounds.size.width;
    
    
    UIBarButtonItem * rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
}

- (void)setBackStr:(NSString *)backStr {
    
    if (self.hiddenLeftBtn) {
        return;
    }
    
    //导航左按钮
    leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [leftBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitle:backStr forState:UIControlStateNormal];
    [leftBtn setTitleColor:GNavBtnTitleColorNormal forState:UIControlStateNormal];
    [leftBtn setTitleColor:GNavBtnTitleColorSelect forState:UIControlStateHighlighted];
    leftBtn.titleLabel.font = GNavBtnTitleFont;
    
    [leftBtn sizeToFit];
    
    self.cusLeftBtnW = leftBtn.bounds.size.width;
    
    UIBarButtonItem * leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
}

- (void)setBackImage:(UIImage *)backImage {
    [leftBtn setImageEdgeInsets:UIEdgeInsetsZero];
    [leftBtn setImage:backImage forState:UIControlStateNormal];
}

- (void)setNavBgImage:(UIImage *)bgImage {
    _navBgImage = bgImage;
    if (_navBgImage) {
         [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    }

}

- (void)setNavShadowImage:(UIImage *)navShadowImage {
    _navShadowImage = navShadowImage;
    if (_navShadowImage) {
        [self.navigationController.navigationBar setShadowImage:_navShadowImage];
    }
}

#pragma mark-

#pragma mark- 自定义视图
- (void)setLeftBtnV:(UIView *)leftBtnV {
    if (!leftBtnV) {
        return;
    }
    _leftBtnV = leftBtnV;
    self.cusLeftBtnW = _leftBtnV.bounds.size.width;
    
    UIBarButtonItem * leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtnV];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
}

- (void)setRightBtnV:(UIView *)rightBtnV {
    if (!rightBtnV) {
        return;
    }
    _rightBtnV = rightBtnV;
    self.cusRightBtnW = _rightBtnV.bounds.size.width;
    
    UIBarButtonItem * rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtnV];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

- (void)cusRightBtnVWithImageArr:(NSArray *)imageArr clickBlock:(GCusNavClickIndex)clickBlock {
    if (imageArr.count == 0 || imageArr.count > 2) {
        return;
    }
    
    if (!clickBlock) {
        return;
    }
    _cusNavClickIndex = clickBlock;
    
    UIView * cusView = [[UIView alloc] initWithFrame:CGRectZero];
    
    cusView.frame = CGRectMake(0, 0, (imageArr.count == 1)?40:80, 40);
    
    for (int i = 0; i < imageArr.count; i ++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = 10086 + i;
        
        btn.frame = CGRectMake((i == 0)?0:40, 2, 40, 40);
        [btn setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(cusRightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        
        //        [btn setTitleColor:GNavBtnTitleColorNormal forState:UIControlStateNormal];
        //        [btn setTitleColor:GNavBtnTitleColorSelect forState:UIControlStateHighlighted];
        //        btn.titleLabel.font = GNavBtnTitleFont;
        
        [cusView addSubview:btn];
        
    }
    
    self.cusRightBtnW = cusView.bounds.size.width;
    
    UIBarButtonItem * rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:cusView];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

- (void)setTitleV:(UIView *)titleV {
    if (!titleV) {
        return;
    }
    
    _titleV = titleV;
    
    if (_titleViewCenter) {
        CGRect frame = [self getMaxTitleViewRect];
        titleV.frame = frame;
    }
    
    NSLog(@"------- %f %f %f %f",titleV.frame.origin.x,titleV.frame.origin.y,titleV.frame.size.width,titleV.frame.size.height);
    if (self.navigationItem.titleView) {
        self.navigationItem.titleView = nil;
    }
    
    self.navigationItem.titleView = titleV;
}

#pragma mark titleView 最大宽度 才居中
/**
 *  titleView 最大宽度 才居中
 *
 *  @return rect
 */
- (CGRect)getMaxTitleViewRect {
    
    CGRect frame = CGRectZero;
    
    CGFloat maxWidth = _cusLeftBtnW > _cusRightBtnW ? _cusLeftBtnW : _cusRightBtnW;
    
    maxWidth += 15 + 15;//leftview 左右都有间隙，左边是5像素，右边是8像素，加2个像素的阀值 5 ＋ 8 ＋ 2
    
    frame.size.width = [UIScreen mainScreen].bounds.size.width - maxWidth * 2;
    frame.size.height = 44;
    
    return frame;
}

#pragma mark-


#pragma mark- 按钮点击事件
/**
 *  按钮点击事件 返回 中间 右侧
 */
- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)centerBtnClick {
    NSLog(@"标题视图点击");
}
- (void)rightBtnClick {
    NSLog(@"右侧点击");
}
- (void)cusRightBtnClick:(UIButton *)sender {
    if (_cusNavClickIndex) {
        _cusNavClickIndex(sender.tag - 10086);
    }
}

#ifdef __IPHONE_7_0
//- (UIRectEdge)edgesForExtendedLayout {
//    return UIRectEdgeNone;
//}
#endif

#pragma mark- 旋转到横屏隐藏 状态栏 旋转相关
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    NSLog(@"rotate TO %ld",(long)toInterfaceOrientation);
    if (toInterfaceOrientation != UIInterfaceOrientationPortrait && toInterfaceOrientation != UIInterfaceOrientationUnknown) {
        
         [self hiddenStatusBarOperate:_hiddenStatusBarWhenRotate];
        
    } else {
        
         [self hiddenStatusBarOperate:_hiddenStatusBar];
        

    }
}

#pragma mark- 旋转相关 旋转控制 在所在的tabBar或Navigation控制器中控制
//当前视图是否 允许旋转 YES允许 NO不允许
- (BOOL)shouldAutorotate {
    return _canRotate;
}
//支持那些旋转方向（project设置的）
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return (_canRotate)?UIInterfaceOrientationMaskAll:UIInterfaceOrientationMaskPortrait;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- Util
- (instancetype)setTabBarItemWithTitle:(NSString *)title
               titleUnSelectStyle:(NSDictionary *)titleUnSelectStyle
                 titleSelectStyle:(NSDictionary *)titleSelectStyle
                    unselectImage:(UIImage *)unselectImage
                      selectImage:(UIImage *)selectImage
                        imageSize:(CGSize)imageSize {
    
    self.tabBarItem.title = title;
    [self.tabBarItem setSelectedImage:[self.class imageWithSize:imageSize image:selectImage]];
    [self.tabBarItem setImage:[self.class imageWithSize:imageSize image:unselectImage]];
    
    [self.tabBarItem setTitleTextAttributes:titleUnSelectStyle forState:UIControlStateNormal];
    [self.tabBarItem setTitleTextAttributes:titleSelectStyle forState:UIControlStateSelected];
    
    return self;
}

- (HXBaseNavgationController *)addNav {
    HXBaseNavgationController * nav = [[HXBaseNavgationController  alloc] initWithRootViewController:self];
    return nav;
}

+ (UIImage *)imageWithSize:(CGSize)size image:(UIImage *)image {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    image =   [UIGraphicsGetImageFromCurrentImageContext() imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIGraphicsEndImageContext();
    return image;
}



- (void)pushRootNav:(UIViewController *)viewController animated:(BOOL)animated {

   id rootVC = [UIApplication sharedApplication].delegate.window.rootViewController;
    if ([rootVC isKindOfClass:[UINavigationController class]]) {
        UINavigationController * rootVCNav = rootVC;
        [rootVCNav pushViewController:viewController animated:animated];
    } else {
        [self.navigationController pushViewController:viewController animated:YES];
    }
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
