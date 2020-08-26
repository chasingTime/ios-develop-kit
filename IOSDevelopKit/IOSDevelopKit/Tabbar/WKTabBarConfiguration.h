//
//  WKTabBarConfiguration.h
//  ProMamage
//
//  Created by apple on 2020/8/13.
//  Copyright © 2020 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WKTabBarConfiguration : NSObject
#pragma mark - 控制器
@property(nonatomic,strong)UIViewController* vc;
#pragma mark - 标题控制类
// item的标题
@property(nonatomic, copy)NSString *itemTitle;
// 默认标题颜色 默认灰色
@property (nonatomic, strong) UIColor *normalColor;
// 选中标题颜色 默认AxcAE_TabBarItemSlectBlue
@property (nonatomic, strong) UIColor *selectColor;

#pragma mark - 图片控制类
// 选中后的图片名称
@property(nonatomic, copy)NSString *selectImageName;
// 正常的图片名称
@property(nonatomic, copy)NSString *normalImageName;
// 默认的 图片tintColor
@property(nonatomic, strong)UIColor *normalTintColor;
// 选中的 图片tintColor
@property(nonatomic, strong)UIColor *selectTintColor;

#pragma mark - item背景控制类
// 默认的 按钮背景Color 默认无
@property(nonatomic, strong)UIColor *normalBackgroundColor;
// 选中的 按钮背景Color 默认无
@property(nonatomic, strong)UIColor *selectBackgroundColor;
// 单个item的背景图
@property(nonatomic, strong)UIImageView *backgroundImageView;
@end

NS_ASSUME_NONNULL_END
