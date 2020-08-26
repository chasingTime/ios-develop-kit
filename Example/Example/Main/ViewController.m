//
//  ViewController.m
//  Example
//
//  Created by apple on 2020/8/26.
//  Copyright © 2020 apple. All rights reserved.
//

#import "ViewController.h"
#import <IOSDevelopKit/View+MASAdditions.h>
//实现代理和数据源代理
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate  = self;
    self.tableView.dataSource = self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

/*
 * 有多少组在TableView，返回NSInteger,多少组
 * 告诉TableView有多少组
 */
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
/*
 * 告诉第几组有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dic = self.dataArray[section];
    NSArray *arr = [dic objectForKey:@"arr"];
    return arr.count;
   
}
/*
 * 选择行时，触发此函数
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
/*
 *告诉TableView每一行显示的内容，每一行都是一个UITableViewCell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell* cell = [[UITableViewCell alloc]init];
    
    //设置cell右边显示控件,accessoryView优先级 > accessoryType
//    cell.accessoryView = [[UISwitch alloc]init];
    //设置cell右边的指示样式
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
 /*   //如果是第0组，第0行，显示内容
    if(indexPath.section == 0)
    {
        if(indexPath.row ==0)
        {
//            cell.imageView.image = [UIImage imageNamed:@""];
            cell.textLabel.text = @"Frame";
        }
    }
    return cell;*/
    NSDictionary *dic = self.dataArray[indexPath.section];
    NSArray *arr = [dic objectForKey:@"arr"];
    NSDictionary *rowDic = arr[indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"axc"];
    
    NSMutableAttributedString *titleStr = [self markString:[NSString stringWithFormat:@"%ld.",indexPath.row + 1]
                                                     color:[UIColor orangeColor]
                                                      font:[UIFont fontWithName:@"Marker Felt" size:16]];
    
    //设置中文倾斜
    CGAffineTransform matrix =CGAffineTransformMake(1, 0, tanf(5 * (CGFloat)M_PI / 180), 1, 0, 0);//设置反射。倾斜角度。
    
    UIFontDescriptor *desc = [ UIFontDescriptor fontDescriptorWithName :[UIFont systemFontOfSize:14].fontName matrix:matrix];//取得系统字符并设置反射。
    
    UIFont *font = [UIFont fontWithDescriptor :desc size :16];
    [titleStr appendAttributedString: [self markString:[NSString stringWithFormat:@"  %@",[rowDic objectForKey:@"title"]]
                                                 color:[UIColor grayColor]
                                                  font:font]];
    
    cell.textLabel.attributedText = titleStr;
    
    cell.detailTextLabel.text = [rowDic objectForKey:@"VCName"];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:8];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    
    //设置cell右边显示控件,accessoryView优先级 > accessoryType
    //设置cell右边的指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
//    cell.backgroundColor = indexPath.row %2 ==0?[UIColor whiteColor]:AxcAE_TabBarRGB(248, 248, 248);
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
    
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    
}
/*
 * 告诉TableView每一组的头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return @"UI";
    }
    return @"Frame";
}
/*
 *告诉tableView每一组的尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"尾部";
}
/*
 *
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
#pragma mark - 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
// 富文本
- (NSMutableAttributedString *)markString:(NSString *)str color:(UIColor *)color font:(UIFont *)font{
    NSMutableAttributedString *attributedString_M = [[NSMutableAttributedString alloc] initWithString:str ];
    [attributedString_M addAttribute:NSForegroundColorAttributeName
                               value:color
                               range:NSMakeRange(0, str.length)];
    [attributedString_M addAttribute:NSFontAttributeName
                               value:font
                               range:NSMakeRange(0, str.length)];
    return attributedString_M;
}
-(NSArray*)dataArray
{
    if (!_dataArray) {
        _dataArray = @[
                       @{@"arr":@[@{@"VCName":@"BasedUsingTabBarVC",@"title":@"AxcAE_TabBar基础使用"},
                                  @{@"VCName":@"CustomImageTabBarVC",@"title":@"自定义TabBar背景图"},
                                  @{@"VCName":@"CustomImageSelColorTabBarVC",@"title":@"自定义TabBar背景图+选中颜色"},
                                  @{@"VCName":@"ImageTranslucentTabBarVC",@"title":@"自定义TabBar背景图+模糊效果"},
                                  @{@"VCName":@"BulgeCircularTabBarVC",@"title":@"TabBar中间圆形凸出"},
                                  @{@"VCName":@"MultipleBulgeCircularTabBarVC",@"title":@"TabBar多重圆形凸出"},
                                  @{@"VCName":@"BulgeSquareTabBarVC",@"title":@"TabBar矩形图片凸出"},
                                  @{@"VCName":@"MultipleBulgeHybridTabBarVC",@"title":@"TabBar多重混合凸出"},
                                  @{@"VCName":@"ItemSizeTabBarVC",@"title":@"按钮自定义大小"},
                                  @{@"VCName":@"ItemSizeAlignmentTabBarVC",@"title":@"按钮自定义对齐模式"},
                                  @{@"VCName":@"ItemSizeLayoutTabBarVC",@"title":@"按钮自定义布局模式"},
                                  @{@"VCName":@"ItemCustomBadgeTabBarVC",@"title":@"按钮自定义徽标"},
                                  @{@"VCName":@"ItemCustomAnimationTabBarVC",@"title":@"按钮自定义交互动画"},
                                  @{@"VCName":@"ItemTingColorTabBarVC",@"title":@"按钮自定义渲染图片"},
                                  @{@"VCName":@"ItemBackgroundColorTabBarVC",@"title":@"按钮自定义背景颜色"},
                                  @{@"VCName":@"ItemBackgroundImageTabBarVC",@"title":@"按钮自定义背景图"}],
                         @"title":@"使用方法"},
                       
                       @{@"arr":@[@{@"VCName":@"HybridGradientHelperTabBarVC",@"title":@"与WHGradientHelper混合使用"},
                                  @{@"VCName":@"WHGradientHelperGradientTabBarVC",@"title":@"WHGradientHelper渐变色"},
                                  @{@"VCName":@"WHGradientHelperGradientTabBarVC2",@"title":@"WHGradientHelper渐变色2"},
                                  @{@"VCName":@"WHGradientHelperGradientTabBarVC3",@"title":@"WHGradientHelper渐变色3"},
                                  @{@"VCName":@"WHGradientHelperGradientTabBarVC4",@"title":@"WHGradientHelper渐变色4"},
                                  @{@"VCName":@"WHGradientHelperGradientItemTabBarVC",@"title":@"WHGradientHelper按钮渐变色"}],
                         @"title":@"WHGradientHelper混合示例" },
                       
                       @{@"arr":@[@{@"VCName":@"WeiBoTabBarVC",@"title":@"微博TabBar"},
                                  @{@"VCName":@"SaltedFishTabBarVC",@"title":@"咸鱼TabBar"},
                                  @{@"VCName":@"JianShuTabBarVC",@"title":@"简书TabBar"}],
                         @"title":@"模仿示例" },
                       
                       @{@"arr":@[@{@"VCName":@"PushHiddenTabBarVC",@"title":@"TabBar使用相关"}],
                         @"title":@"适配示例" }
                       ].copy;
    }
    return _dataArray;
}
@end
