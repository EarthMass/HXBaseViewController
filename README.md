# HXBaseViewController
HXBaseViewController快速搭建界面的导航栏配置

# 功能
 * 高度定制化
 * 使用简单
 * 支持旋转，导航栏等配置。
 通过继承 HXBaseViewController 类，对带导航的界面进行定制，类中已做了初始化设置，
 ##最好是 继承 HXBaseViewController 配置样式，然后继承你自定义的类。

# 版本要求 IOS8+
# 安装 pod
```
pod 'HXBaseViewController'
```

# 效果
![](https://github.com/EarthMass/HXBaseViewController/blob/master/HXProgressGif.gif)

# 使用
* 引入 头文件 
```
#import "HXTabBarController.h" //tabBar
```

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    //自定导航栏
//    BaseNavVCDemo * navView =  [[BaseNavVCDemo alloc] init];
//    UINavigationController * viewC = [[UINavigationController alloc] initWithRootViewController:navView];
//    [self.window setRootViewController:viewC];
    
    self.nav = [self tabBarController];
    [self.window setRootViewController:self.nav];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UINavigationController *)tabBarController {
    
    
    HXTabBarController * tabBarC = [[HXTabBarController alloc] init];
    
    TabBarVC1 * tabBarVC1 = [[TabBarVC1 alloc] init];
    [tabBarVC1 setTabBarItemWithTitle:@"111" titleUnSelectStyle:nil titleSelectStyle:nil unselectImage:[UIImage imageNamed:@"tab.png"] selectImage:[UIImage imageNamed:@"barItemIcon"] imageSize:CGSizeMake(30, 30)];
    
    TabBarVC2 * tabBarVC2 = [[TabBarVC2 alloc] init];
    [tabBarVC2 setTabBarItemWithTitle:@"222" titleUnSelectStyle:nil titleSelectStyle:nil unselectImage:[UIImage imageNamed:@"tab.png"] selectImage:[UIImage imageNamed:@"barItemIcon"] imageSize:CGSizeMake(30, 30)];
    
    TabBarVC3 * tabBarVC3 = [[TabBarVC3 alloc] init];
    [tabBarVC3 setTabBarItemWithTitle:@"333" titleUnSelectStyle:nil titleSelectStyle:nil unselectImage:[UIImage imageNamed:@"tab.png"] selectImage:[UIImage imageNamed:@"barItemIcon"] imageSize:CGSizeMake(30, 30)];
    
    TabBarVC4 * tabBarVC4 = [[TabBarVC4 alloc] init];
    [tabBarVC4 setTabBarItemWithTitle:@"444" titleUnSelectStyle:nil titleSelectStyle:nil unselectImage:[UIImage imageNamed:@"tab.png"] selectImage:[UIImage imageNamed:@"barItemIcon"] imageSize:CGSizeMake(30, 30)];
    
    tabBarC.viewControllers = @[[tabBarVC1 addNav],[tabBarVC2 addNav],[tabBarVC3 addNav],[tabBarVC4 addNav]];
    
    UINavigationController * rootNav = [[UINavigationController alloc ] initWithRootViewController:tabBarC];
    [rootNav setNavigationBarHidden:YES];
    return rootNav;
}
```
可配置 引入 HXBaseViewController.h
```
/**
 *  自定义视图 右侧按钮 左侧按钮 标题
 */
@property (nonatomic, strong) UIView * leftBtnV;
@property (nonatomic, strong) UIView * rightBtnV;
@property (nonatomic, strong) UIView * titleV; ///<最后设置 先设置两边按钮[便于计算最大的宽度]

/**
 *  左右标题
 */
@property (nonatomic, copy) NSString * backStr;
@property (nonatomic, copy) NSString * rightStr;

@property (nonatomic, strong) UIImage * backImage;

@property (nonatomic, assign) BOOL hiddenStatusBar; ///<状态栏隐藏 默认显示NO
@property (nonatomic, assign) BOOL hiddenStatusBarWhenRotate; ///<旋转时是否隐藏状态栏


@property (nonatomic, assign) BOOL hiddenLeftBtn; ///<隐藏返回按钮 默认显示
@property (nonatomic, assign) BOOL canGesBack; ///<是否可以 滑动 返回上一级 默认有效
@property (nonatomic, assign) BOOL canFullScreenGesBack; ///<是否可以 全屏滑动 返回上一级 默认有效 [canFullScreenGesBack 高于 canGesBack]

@property (nonatomic, assign) BOOL canRotate; ///<是否支持旋转 默认NO ,YES工程必须支持旋转才有效
@property (nonatomic, assign) BOOL titleViewCenter; ///<标题栏 是否居中 默认 居中,YES 根据边缘的最大，确定中间大小， NO 中间文字充满

#pragma mark- 全局的 改变一个影响全部的视图,直到重新设置
@property (nonatomic, assign) BOOL statusBarTextIsWhite; ///<状态栏字体颜色  默认白色
@property (nonatomic, assign) UIColor * statusBarBackgroundColor; ///<状态栏颜色
@property (nonatomic, assign) UIColor * navBarColor; ///<导航栏颜色 配置

/**
 *   YES 需要加这个 在当前控制器中 否则 导航栏底部显示的是window view起点从y = 64开始
 *  #ifdef __IPHONE_7_0
 - (UIRectEdge)edgesForExtendedLayout {
 return UIRectEdgeTop;
 }
 #endif
 view起点从y = 0开始
 */
@property (nonatomic, assign) BOOL navBarTranslucent; ///<导航栏是否透明 NO  YES 需要加这个[***顶部注释***] 在当前控制器中 否则 导航栏底部显示的是window view起点从y = 64开始, 手势返回自动关闭，避免导航问题

/**
 *  设置 自定义的 导航栏 右侧 图片按钮【两个/一个】
 *
 *  @param imageArr   图片数组【最多两个】 大小20*20
 *  @param clickBlock 点击事件
 */
- (void)cusRightBtnVWithImageArr:(NSArray *)imageArr clickBlock:(GCusNavClickIndex)clickBlock;
```


有什么问题，情联系我 627556038@qq.com
