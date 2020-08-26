//
//  BaseTabBar.h
//  ProMamage
// tabbar的属性类型在: AxcAE_TabBarBadge.h这个类中
//  Created by apple on 2020/8/13.
//  Copyright © 2020 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AxcAE_TabBar.h"
#import "WKTabBarConfiguration.h"
NS_ASSUME_NONNULL_BEGIN

@interface BaseTabBar : UITabBarController
@property (nonatomic, strong) AxcAE_TabBar *axcTabBar;
- (void)addChildViewControllers:(NSArray <NSDictionary *>*)VCArray;
- (void)addChildViewControllersFromWKTabBarConfiguration:(NSArray <WKTabBarConfiguration *>*)VCArray;
@end

NS_ASSUME_NONNULL_END
