//
//  BaseTabBar.m
//  ProMamage
//
//  Created by apple on 2020/8/13.
//  Copyright © 2020 apple. All rights reserved.
//

#import "BaseTabBar.h"

@interface BaseTabBar ()<AxcAE_TabBarDelegate>

@end

@implementation BaseTabBar

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
//Controller、标题、标题文字颜色、选中时标题文字颜色、图标、选中时图标、背影色
- (void)addChildViewControllers:(NSArray <NSDictionary *>*)VCArray
{
    // 1.遍历这个集合
    // 1.1 设置一个保存构造器的数组
    NSMutableArray *tabBarConfs = @[].mutableCopy;
    // 1.2 设置一个保存VC的数组
    NSMutableArray *tabBarVCs = @[].mutableCopy;
    [VCArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 2.根据集合来创建TabBar构造器
        AxcAE_TabBarConfigModel *model = [obj objectForKey:@"model"];
        UIViewController *vc = [obj objectForKey:@"vc"];
        /*
        AxcAE_TabBarConfigModel *model = [AxcAE_TabBarConfigModel new];
        // 3.item基础数据三连
        model.itemTitle = [obj objectForKey:@"itemTitle"];
        
        model.selectImageName = [obj objectForKey:@"selectImg"];
        model.normalImageName = [obj objectForKey:@"normalImg"];
        
        
        
        // 备注 如果一步设置的VC的背景颜色，VC就会提前绘制驻留，优化这方面的话最好不要这么写
        // 示例中为了方便就在这写了
        UIViewController *vc = [obj objectForKey:@"vc"];
//        vc.view.backgroundColor =[obj objectForKey:@"backgroundColor"];
        
        //设置正常时标题颜色
        // 4.设置单个选中item标题状态下的颜色
        if([obj objectForKey:@"normalTitleColor"]!=nil)
        {
            model.normalColor = [obj objectForKey:@"normalTitleColor"];
        }
        
        //设置单个选中item标题状态下的颜色,默认为橙色
        if([obj objectForKey:@"selectTitleColor"]!=nil)
        {
            model.selectColor = [obj objectForKey:@"selectTitleColor"];
        }
        
      
        model.normalImageName = [obj objectForKey:@"normalImg"];//正常时图片
        model.selectImageName = [obj objectForKey:@"selectImg"];//选中时图片
        //如果选中的图标是空的话，那设置选中时k图标与正常图标一样
        if([obj objectForKey:@"selectImg"]==nil)
        {
             model.selectImageName = [obj objectForKey:@"normalImg"];//选中时图片
        }
        
        */
        
        
        // 5.将VC添加到系统控制组
        [tabBarVCs addObject:vc];
        // 5.1添加构造Model到集合
        [tabBarConfs addObject:model];
    }];
    // 5.2 设置VCs -----
    // 一定要先设置这一步，然后再进行后边的顺序，因为系统只有在setViewControllers函数后才不会再次创建UIBarButtonItem，以免造成遮挡
    // 大意就是一定要让自定义TabBar遮挡住系统的TabBar
    self.viewControllers = tabBarVCs;
    //////////////////////////////////////////////////////////////////////////
    // 注：这里方便阅读就将AE_TabBar放在这里实例化了 使用懒加载也行
    // 6.将自定义的覆盖到原来的tabBar上面
    // 这里有两种实例化方案：
    // 6.1 使用重载构造函数方式：
    //    self.axcTabBar = [[AxcAE_TabBar alloc] initWithTabBarConfig:tabBarConfs];
    // 6.2 使用Set方式：
    self.axcTabBar = [AxcAE_TabBar new] ;
    self.axcTabBar.tabBarConfig = tabBarConfs;
    // 7.设置委托
    self.axcTabBar.delegate = self;
    // 8.添加覆盖到上边
    [self.tabBar addSubview:self.axcTabBar];
    [self addLayoutTabBar]; // 10.添加适配
}
- (void)addChildViewControllersFromWKTabBarConfiguration:(NSArray <WKTabBarConfiguration *>*)VCArray
{
    // 1.遍历这个集合
    // 1.1 设置一个保存构造器的数组
    NSMutableArray *tabBarConfs = @[].mutableCopy;
    // 1.2 设置一个保存VC的数组
    NSMutableArray *tabBarVCs = @[].mutableCopy;
    [VCArray enumerateObjectsUsingBlock:^(WKTabBarConfiguration * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 2.根据集合来创建TabBar构造器
        AxcAE_TabBarConfigModel *model = [AxcAE_TabBarConfigModel new];
        // 3.item基础数据三连
        model.itemTitle = obj.itemTitle;
        
        model.selectImageName = obj.selectImageName;
        model.normalImageName = obj.normalImageName;
        
        
        
        // 备注 如果一步设置的VC的背景颜色，VC就会提前绘制驻留，优化这方面的话最好不要这么写
        // 示例中为了方便就在这写了
        UIViewController *vc = obj.vc;
        vc.view.backgroundColor =obj.normalBackgroundColor;
        
        //设置正常时标题颜色
        // 4.设置单个选中item标题状态下的颜色
        if(obj.normalColor!=nil)
        {
            model.normalColor = obj.normalColor;
        }
        
        //设置单个选中item标题状态下的颜色,默认为橙色
        if(obj.selectColor!=nil)
        {
            model.selectColor = obj.selectColor;
        }
        
        
        model.normalImageName = obj.normalImageName;//正常时图片
        model.selectImageName = obj.selectImageName;//选中时图片
        //如果选中的图标是空的话，那设置选中时k图标与正常图标一样
        if(obj.selectImageName==nil)
        {
            model.selectImageName = obj.normalImageName;
        }
        
        
        
        
        // 5.将VC添加到系统控制组
        [tabBarVCs addObject:vc];
        // 5.1添加构造Model到集合
        [tabBarConfs addObject:model];
    }];
    // 5.2 设置VCs -----
    // 一定要先设置这一步，然后再进行后边的顺序，因为系统只有在setViewControllers函数后才不会再次创建UIBarButtonItem，以免造成遮挡
    // 大意就是一定要让自定义TabBar遮挡住系统的TabBar
    self.viewControllers = tabBarVCs;
    //////////////////////////////////////////////////////////////////////////
    // 注：这里方便阅读就将AE_TabBar放在这里实例化了 使用懒加载也行
    // 6.将自定义的覆盖到原来的tabBar上面
    // 这里有两种实例化方案：
    // 6.1 使用重载构造函数方式：
    //    self.axcTabBar = [[AxcAE_TabBar alloc] initWithTabBarConfig:tabBarConfs];
    // 6.2 使用Set方式：
    self.axcTabBar = [AxcAE_TabBar new] ;
    self.axcTabBar.tabBarConfig = tabBarConfs;
    // 7.设置委托
    self.axcTabBar.delegate = self;
    // 8.添加覆盖到上边
    [self.tabBar addSubview:self.axcTabBar];
    [self addLayoutTabBar]; // 10.添加适配
}
// 9.实现代理，如下：
- (void)axcAE_TabBar:(AxcAE_TabBar *)tabbar selectIndex:(NSInteger)index{
    // 通知 切换视图控制器
    [self setSelectedIndex:index];
    // 自定义的AE_TabBar回调点击事件给TabBarVC，TabBarVC用父类的TabBarController函数完成切换
}
- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    if(self.axcTabBar){
        self.axcTabBar.selectIndex = selectedIndex;
    }
}

// 10.添加适配
- (void)addLayoutTabBar{
    // 使用重载viewDidLayoutSubviews实时计算坐标 （下边的 -viewDidLayoutSubviews 函数）
    // 能兼容转屏时的自动布局
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.axcTabBar.frame = self.tabBar.bounds;
    [self.axcTabBar viewDidLayoutItems];
}

@end
