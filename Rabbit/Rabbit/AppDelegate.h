//
//  AppDelegate.h
//  Rabbit
//
//  Created by Rabbit on 2018/4/13.
//  Copyright © 2018年 Rabbit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


//旋转方向 默认竖屏
@property (nonatomic , assign) UIInterfaceOrientation interfaceOrientation;
@property (nonatomic , assign) UIInterfaceOrientationMask interfaceOrientationMask;

@property(nonatomic ,assign)BOOL isLandscape;
@end

