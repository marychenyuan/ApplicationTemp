//
//  ATTabbarViewController.m
//  ApplicationTemp
//
//  Created by 陈园 on 15/11/5.
//  Copyright © 2015年 陈园. All rights reserved.
//

#import "ATTabbarViewController.h"
#import "FirstPageViewController.h"
#import "TwoPageViewController.h"
#import "ThreePageViewController.h"
#import "FourPageViewController.h"
#import "ATNavigationController.h"

@interface ATTabbarViewController ()

@end

@implementation ATTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加所有的子控制器
    [self addAllViewController];

}

+ (void)initialize{
    [self setupBarButtonItemTheme];
}


- (void)addAllViewController{
    FirstPageViewController *firstPageVC = [[FirstPageViewController alloc] init];
    [self addOneChildVC:firstPageVC title:@"首页" imageName:@"tabbar_home"];
    TwoPageViewController *twoPageVC = [[TwoPageViewController alloc] init];
    [self addOneChildVC:twoPageVC title:@"列表" imageName:@"tabbar_list"];
    ThreePageViewController *threePageVC = [[ThreePageViewController alloc] init];
    [self addOneChildVC:threePageVC title:@"理财师" imageName:@"tabbar_team"];
    FourPageViewController *fourPageVC = [[FourPageViewController alloc] init];
    [self addOneChildVC:fourPageVC title:@"我的账号" imageName:@"tabbar_user"];
    
    //设置渲染颜色
    self.tabBar.tintColor = [UIColor orangeColor];
    
}


- (void)addOneChildVC:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName{
    //标题
    childVC.title = title;
    
    //图片
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //导航栏
    ATNavigationController *navController = [[ATNavigationController alloc] initWithRootViewController:childVC];
    
    //添加子控制器
    [self addChildViewController:navController];
}


/**
 *  设置UIBarButtonItem的主题
 */
+ (void)setupBarButtonItemTheme
{
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    /**设置文字属性**/
    // 普通状态
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeZero;
    textAttrs[NSShadowAttributeName] = shadow;
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 高亮状态
    NSMutableDictionary *highTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    highTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [appearance setTitleTextAttributes:highTextAttrs forState:UIControlStateHighlighted];
    
    // 不可用状态(disable)
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
}


@end
