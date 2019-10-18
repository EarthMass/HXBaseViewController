//
//  HXBaseViewController.h
//  TestProject
//
//  Created by Guohx on 16/5/20.
//
//

#import <UIKit/UIKit.h>
#import "UINavigationItem+margin.h"
#import "HXBaseNavgationController.h"

//视图背景颜色
#define GBackGroundColor [UIColor colorWithRed:0.960 green:1.000 blue:0.984 alpha:1.000]

//导航栏 属性 标题颜色 标题字体
#define GNavTextColor [UIColor whiteColor]
static int fontSize = 18; ///<导航栏标题文字 字体大小
#define GNavTextFont (GFONT(fontSize))

//导航 按钮 字体、颜色
#define GNavBtnTitleFont (GFONT(fontSize - 2))
#define GNavBtnTitleColorNormal [UIColor whiteColor]
#define GNavBtnTitleColorSelect [UIColor colorWithWhite:0.806 alpha:1.000]

//导航栏 颜色
#define GNavBgColor [UIColor colorWithRed:0.213 green:0.551 blue:1.000 alpha:0.000]

//默认导航 返回 按钮图标 名称
#define GNavBackImageName @"nav_btn_back_def" //修改返回图标，通过 backImage

//不同设备的屏幕比例(当然倍数可以自己控制) plus 字体比 普通大 1.5倍
#define GFONT_SIZE_SCALE (([UIScreen mainScreen].bounds.size.height > 667) ? 1 : 1)
#define GFONT(fontSize) [UIFont systemFontOfSize:fontSize*GFONT_SIZE_SCALE]

/**
 *  自定义右侧 按钮 点击事件
 *
 *  @param index 索引
 */
typedef void(^GCusNavClickIndex)(NSInteger index);
/**
 *  自定义导航栏
 */
@interface HXBaseViewController : UIViewController

#warning 在vc内部设置才有效
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
@property (nonatomic, strong) UIImage * navBgImage;
@property (nonatomic, strong) UIImage * navShadowImage;

@property (nonatomic, assign) BOOL hiddenStatusBar; ///<状态栏隐藏 默认显示NO
@property (nonatomic, assign) BOOL hiddenStatusBarWhenRotate; ///<旋转时是否隐藏状态栏


@property (nonatomic, assign) BOOL hiddenLeftBtn; ///<隐藏返回按钮 默认显示
@property (nonatomic, assign) BOOL canGesBack; ///<是否可以 滑动 返回上一级 默认有效
@property (nonatomic, assign) BOOL canFullScreenGesBack; ///<是否可以 全屏滑动 返回上一级 默认有效 [canFullScreenGesBack 高于 canGesBack]

@property (nonatomic, assign) BOOL canRotate; ///<是否支持旋转 默认NO ,YES工程必须支持旋转才有效
@property (nonatomic, assign) BOOL titleViewCenter; ///<标题栏 是否居中 默认 居中,YES 根据边缘的最大，确定中间大小， NO 中间文字充满

@property (nonatomic, assign) BOOL hiddenNavBar; //隐藏导航栏 default NO


#pragma mark- 全局的 改变一个影响全部的视图,直到重新设置
@property (nonatomic, assign) BOOL statusBarTextIsWhite; ///<状态栏字体颜色  默认白色
@property (nonatomic, strong) UIColor * statusBarBackgroundColor; ///<状态栏颜色
@property (nonatomic, strong) UIColor * navBarColor; ///<导航栏颜色 配置

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

/**
 *  按钮点击事件 返回 中间 右侧
 */
- (void)backBtnClick;
- (void)centerBtnClick;
- (void)rightBtnClick;

/**
 *  刷新当前设置
 */
- (void)refreshNavSetting;

#pragma mark- Util Tabbar
- (instancetype)setTabBarItemWithTitle:(NSString *)title
               titleUnSelectStyle:(NSDictionary *)titleUnSelectStyle
                 titleSelectStyle:(NSDictionary *)titleSelectStyle
                    unselectImage:(UIImage *)unselectImage
                      selectImage:(UIImage *)selectImage
                        imageSize:(CGSize)imageSize;
- (HXBaseNavgationController *)addNav;
+ (UIImage *)imageWithSize:(CGSize)size image:(UIImage *)image;

//判断是否是根层级视图，普通视图
- (void)pushRootNav:(UIViewController *)viewController animated:(BOOL)animated;

@end
