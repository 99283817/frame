//
//  TZTabBarViewController.m
//  Rabbit
//
//  Created by Rabbit on 2018/8/28.
//  Copyright © 2018年 Rabbit. All rights reserved.
//

#import "TZTabBarViewController.h"
#import "TZMainViewController.h"
#import "TZMineViewController.h"
#import "ViewController.h"
#import "UIColor+Hex.h"

#import "TZNavigationController.h"
@interface TZTabBarViewController ()

@end

@implementation TZTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTabBarNature];
     //设置文字颜色
   
    [self configUIWithTitle:@"首页" nomeImage:@"eat-zan-1" selectedImage:@"eat-zan" viewVC:[TZMainViewController new]];
    [self configUIWithTitle:@"测试" nomeImage:@"eat-sc-1" selectedImage:@"eat-sc" viewVC:[ViewController new]];
    [self configUIWithTitle:@"我的" nomeImage:@"eat-sc-1" selectedImage:@"eat-sc" viewVC:[TZMineViewController new]];
}


-(void)setTabBarNature{
    //去掉自带阴影
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [UITabBar appearance].translucent = NO;
//    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
//    [[UITabBar appearance] setBarTintColor:[UIColor grayColor]];
    // 普通状态下的文字属性
    // 选中状态下的文字属性
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor brownColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"cc0000"], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
}






-(void)configUIWithTitle:(NSString *)title  nomeImage:(NSString *)imageStr selectedImage:( NSString *)selectedImageStr  viewVC:(UIViewController *)vc{
    
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    //    UIImage *home = [UIImage imageNamed:@"home"];
    //    UIImage *home_h = [UIImage imageNamed:@"home-light"];
    UIImage *home = [UIImage imageNamed:imageStr];
    UIImage *home_h = [UIImage imageNamed:selectedImageStr];
//    nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:home selectedImage:home_h];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    
    
    
    //设置图片颜色
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [home imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [home_h imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    
    
    
    [self addChildViewController:nav];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
