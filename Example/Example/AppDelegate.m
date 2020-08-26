//
//  AppDelegate.m
//  Example
//
//  Created by apple on 2020/8/26.
//  Copyright © 2020 apple. All rights reserved.
//

#import "AppDelegate.h"
#import <IOSDevelopKit/AxcAE_TabBarItem.h>
#import "WKTabBarController.h"
#import "Main/ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /*AxcAE_TabBarConfigModel *homeModel = [AxcAE_TabBarConfigModel new];
    homeModel.itemTitle = @"首页";
    homeModel.normalImageName = @"homePage";
    homeModel.selectImageName = @"homePage_select";
    homeModel.normalColor = [UIColor redColor];
    homeModel.selectColor = [UIColor greenColor];
    
    AxcAE_TabBarConfigModel *categoryModel = [AxcAE_TabBarConfigModel new];
    categoryModel.itemTitle = @"分类";
    categoryModel.normalImageName = @"homePage";
    categoryModel.selectImageName = @"homePage_select";
    categoryModel.normalColor = [UIColor redColor];
    categoryModel.selectColor = [UIColor greenColor];
    
    AxcAE_TabBarConfigModel *smallModel = [AxcAE_TabBarConfigModel new];
    smallModel.itemTitle = @"发布";
    smallModel.normalImageName = @"homePage";
    smallModel.selectImageName = @"homePage_select";
    smallModel.normalColor = [UIColor redColor];
    smallModel.selectColor = [UIColor greenColor];
    
    AxcAE_TabBarConfigModel *hotModel = [AxcAE_TabBarConfigModel new];
    hotModel.itemTitle = @"热点";
    hotModel.normalImageName = @"homePage";
    hotModel.selectImageName = @"homePage_select";
    hotModel.normalColor = [UIColor redColor];
    hotModel.selectColor = [UIColor greenColor];
    
    AxcAE_TabBarConfigModel *meModel = [AxcAE_TabBarConfigModel new];
    meModel.itemTitle = @"我的";
    meModel.normalImageName = @"homePage";
    meModel.selectImageName = @"homePage_select";
    meModel.normalColor = [UIColor redColor];
    meModel.selectColor = [UIColor greenColor];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds ];
    
    
    
    WKTabBarController* tabbar = [[WKTabBarController alloc]init];
    WKTabBarConfiguration* config = [[WKTabBarConfiguration alloc]init];
    
    config.itemTitle = @"标题";
    
   
    
//    vc.view.backgroundColor = [UIColor redColor];
    NSArray <NSDictionary *>*VCArray =
    @[@{
          @"vc":vc,//控制器
          @"model":homeModel,//正常图标
          },
      @{@"vc":[UIViewController new],
        @"model":categoryModel
        },
      @{@"vc":[UIViewController new],
        @"model":smallModel
        },
      @{@"vc":[UIViewController new],
        @"model":hotModel
        },
      @{@"vc":[UIViewController new],
        @"model":meModel
        }
      ];
    [tabbar addChildViewControllers:VCArray];
    
    
    
//    [self.window setRootViewController:tabbar];
     */
//     self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    
    ViewController *vc = [[ViewController alloc]init];
    self.window.rootViewController =vc;
    [self.window makeKeyWindow];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
