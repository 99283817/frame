//
//  TZtestViewController.m
//  Rabbit
//
//  Created by Rabbit on 2018/5/16.
//  Copyright © 2018年 Rabbit. All rights reserved.
//

#import "TZtestViewController.h"
#import <Masonry.h>
#import "AppDelegate.h"
@interface TZtestViewController ()
@property(nonatomic ,strong)UIView *view1;
@property(nonatomic ,assign)BOOL isLandscape;
@end

@implementation TZtestViewController

//强制横屏
- (void)forceOrientationLandscape{
    
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    //    appdelegate.isForceLandscape=YES;
    //    appdelegate.isForcePortrait=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
}

//强制竖屏
- (void)forceOrientationPortrait{
    
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    //    appdelegate.isForcePortrait=YES;
    //    appdelegate.isForceLandscape=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.tabBarController.tabBar.hidden = YES;
    
    // 强制横屏
    [self forceOrientationLandscape];
    
//    RootNavigationController *nav = (RootNavigationController *)self.navigationController;
//    nav.interfaceOrientation = UIInterfaceOrientationLandscapeRight;
//    nav.interfaceOrientationMask = UIInterfaceOrientationMaskLandscapeRight;
    
    //强制翻转屏幕，Home键在右边。
    [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
    //刷新
    [UIViewController attemptRotationToDeviceOrientation];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    //强制旋转竖屏
    [self forceOrientationPortrait];
//    RootNavigationController *navi = (RootNavigationController *)self.navigationController;
//    navi.interfaceOrientation = UIInterfaceOrientationPortrait;
//    navi.interfaceOrientationMask = UIInterfaceOrientationMaskPortrait;
    
    //设置屏幕的转向为竖屏
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationPortrait) forKey:@"orientation"];
    //刷新
    [UIViewController attemptRotationToDeviceOrientation];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.tabBarController.tabBar.hidden = NO;
}





//设置样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

//设置是否隐藏
- (BOOL)prefersStatusBarHidden {
    //    [super prefersStatusBarHidden];
    return NO;
}

//设置隐藏动画
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationNone;
}
- (BOOL)shouldAutorotate{
    //是否允许转屏
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
//    self.view1.frame = CGRectMake(100,100 , 100, 100);
//    [self.view1 layoutIfNeeded];
    //viewController所支持的全部旋转方向
//    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
//    return UIInterfaceOrientationMaskAllButUpsideDown;
    
        if (_isLandscape) {
            UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
            if (orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight) {
                return UIInterfaceOrientationMaskLandscape;
            } else { // 横屏后旋转屏幕变为竖屏
                return UIInterfaceOrientationMaskPortrait;
            }
        }
        else
        {
            return UIInterfaceOrientationMaskAllButUpsideDown;
        }
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    //viewController初始显示的方向
    return UIInterfaceOrientationLandscapeLeft;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _isLandscape = NO;
    
    [self forceOrientationLandscape];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    self.view1 = [UIView new ];
    self.view1.backgroundColor = [UIColor blackColor];
    self.view1.frame = CGRectMake(0,100 , 50, 100);
    [self.view addSubview:self.view1];
    
     AppDelegate *app =  (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.isLandscape = YES;
    UITapGestureRecognizer * gestur = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back)];
    [_view1 addGestureRecognizer:gestur];
//    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.mas_offset(0);
//        make.height.with.mas_offset(200);
//    }];
    
}

-(void)back{
//    [self dismissViewControllerAnimated:YES completion:^{
//        AppDelegate *app =  (AppDelegate *)[UIApplication sharedApplication].delegate;
//        app.isLandscape = NO;
//        NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
//        [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
//        NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
//        [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
//    }];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillLayoutSubviews{
//    self.view1.frame = CGRectMake(100,100 , 50, 100);
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
