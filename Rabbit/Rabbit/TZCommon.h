//
//  TZCommon.h
//  Rabbit.com
//
//  Created by Rabbit on 2018/4/13.
//  Copyright © 2018年 Rabbit. All rights reserved.
//

#ifndef TZCommon_h
#define TZCommon_h

//屏幕宽度
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width

//屏幕高度
#define SCREEN_HEIGHT    [[UIScreen mainScreen] bounds].size.height

//系统版本号
#define SYSTEM_VERSION [[UIDevice currentDevice].systemVersion doubleValue]

//获取工具栏高度
#define kDeviceVersion [[UIDevice currentDevice].systemVersion floatValue]

//上层带导航高度
#define StatusBarTopHeight (ScreenHeight == 812.0 ? 44 : 20)

//判断是否是X设备
#define IsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//状态栏+导航栏高度
#define StatusNaviHeight ([UIApplication sharedApplication].statusBarFrame.size.height + 44)

#endif /* TZCommon_h */
