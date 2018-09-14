//
//  TZcategoryScrollView.h
//  Rabbit
//
//  Created by Rabbit on 2018/5/16.
//  Copyright © 2018年 Rabbit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TZcategoryScrollView;
@protocol TZcategoryScrollViewDelete <NSObject>

-(void)touchActive:(TZcategoryScrollView *)scrollView labeltext:(NSString *)text touchCount:(NSInteger )num;

@end

@interface TZcategoryScrollView : UIScrollView

@property(nonatomic, weak)id<TZcategoryScrollViewDelete> sdelegate;

//数据view
@property(nonatomic ,strong)NSArray *textArray;

//赋值后控件最大平分屏幕
@property(nonatomic ,assign)NSInteger pingfenCount;

//是否控件平分屏幕 默认no
@property(nonatomic ,assign)BOOL isPingfen;

//是否显示控件文字大小   为label大小  默认no 显示为文字长度
@property(nonatomic ,assign)BOOL isNoTextLengthShow;



@end
