//
//  AppDelegate.m
//  BaseNavController
//
//  Created by Guohx on 16/5/25.
//  Copyright © 2016年 guohx. All rights reserved.
//

#import "AppDelegate.h"

#import "HXBaseNavgationController.h"
#import "BaseNavVCDemo.h" ///<自定义导航

//tabBarController
#import "TabBarVC1.h"
#import "TabBarVC2.h"
#import "TabBarVC3.h"
#import "TabBarVC4.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    //自定导航栏
    BaseNavVCDemo * navView =  [[BaseNavVCDemo alloc] init];
    UINavigationController * viewC = [[UINavigationController alloc] initWithRootViewController:navView];
    [self.window setRootViewController:viewC];
    
//    self.nav = [self tabBarController];
//    [self.window setRootViewController:self.nav];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (HXBaseNavgationController *)tabBarController {
    
    
    UITabBarController * tabBarC = [[UITabBarController alloc] init];
    
    TabBarVC1 * tabBarVC1 = [[TabBarVC1 alloc] init];
    [tabBarVC1 setTabBarItemWithTitle:@"111" titleUnSelectStyle:nil titleSelectStyle:nil unselectImage:[UIImage imageNamed:@"tab.png"] selectImage:[UIImage imageNamed:@"barItemIcon"] imageSize:CGSizeMake(30, 30)];
    
    TabBarVC2 * tabBarVC2 = [[TabBarVC2 alloc] init];
    [tabBarVC2 setTabBarItemWithTitle:@"222" titleUnSelectStyle:nil titleSelectStyle:nil unselectImage:[UIImage imageNamed:@"tab.png"] selectImage:[UIImage imageNamed:@"barItemIcon"] imageSize:CGSizeMake(30, 30)];
    
    TabBarVC3 * tabBarVC3 = [[TabBarVC3 alloc] init];
    [tabBarVC3 setTabBarItemWithTitle:@"333" titleUnSelectStyle:nil titleSelectStyle:nil unselectImage:[UIImage imageNamed:@"tab.png"] selectImage:[UIImage imageNamed:@"barItemIcon"] imageSize:CGSizeMake(30, 30)];
    
    TabBarVC4 * tabBarVC4 = [[TabBarVC4 alloc] init];
    [tabBarVC4 setTabBarItemWithTitle:@"444" titleUnSelectStyle:nil titleSelectStyle:nil unselectImage:[UIImage imageNamed:@"tab.png"] selectImage:[UIImage imageNamed:@"barItemIcon"] imageSize:CGSizeMake(30, 30)];
    
    tabBarC.viewControllers = @[[tabBarVC1 addNav],[tabBarVC2 addNav],[tabBarVC3 addNav],[tabBarVC4 addNav]];
    
    HXBaseNavgationController * rootNav = [[HXBaseNavgationController alloc ] initWithRootViewController:tabBarC];
    [rootNav setNavigationBarHidden:YES];
    [rootNav.navigationController.navigationBar setHidden:YES];
    return rootNav;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
