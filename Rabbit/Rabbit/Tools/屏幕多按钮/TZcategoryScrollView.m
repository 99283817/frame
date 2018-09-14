//
//  TZcategoryScrollView.m
//  Rabbit
//
//  Created by Rabbit on 2018/5/16.
//  Copyright © 2018年 Rabbit. All rights reserved.
//

#import "TZcategoryScrollView.h"
#import "UILabel+Extension.h"
#import "UIColor+Hex.h"
@implementation TZcategoryScrollView{
    //存放scrollview中添加的view视图
    NSMutableArray * arr_tagscrollView;
    UIImageView *last_image;//名称上一次
    UILabel *last_label;//名称上
    UIView *last_lineView;//显示线上一次
}

 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
// - (void)drawRect:(CGRect)rect {
//
// }

// 设置节目下的分类 列表
-(void)setscrollViewWithArray:(NSArray *)category{
    if (self.arr_tagscrollView.count>0) {
        for (UIView *subview in self.subviews) {
            if([arr_tagscrollView containsObject:subview] ) {
                [subview removeFromSuperview];
            }
            
        }
    }
    if (category.count == 0) {
        return;
    }
    
    int tempX = 0;
    CGFloat  width = 0;
    CGFloat height  = 40;
    [self setBackgroundColor:[UIColor whiteColor]];
    if (_isPingfen || _pingfenCount >0) {
//        大于pingfenCount 平分屏幕宽度  小于pingfenCount 平分屏幕宽度
        if (_pingfenCount >0) {
            width = SCREEN_WIDTH /_pingfenCount;
        }else{
            width = SCREEN_WIDTH /category.count;
        }
    }
    for (int i=0; i<category.count; i++) {
        NSString * text = category[i];
        if (!_isNoTextLengthShow) {
            CGFloat widthStr = [UILabel getSpaceLabelWidth:text withFount:[UIFont systemFontOfSize:14]];
            width = width > widthStr ? width : widthStr;
            if (!_isPingfen && _pingfenCount <=0) {
                width = widthStr +10;
            }
//            width = widthStr+10;
        }
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(tempX, 0, width, height)];
        view.tag = i+10;
//        CGFloat jianxi = 15;
        //        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0 + width/2+jianxi+5, height/2-2, 7, 4)];
        //        [image sd_setImageWithURL:[NSURL URLWithString:ImageUrl(k_un_arrow)] placeholderImage:[UIImage imageNamed:@"ck_gray_arrow"]];
        //        CGFloat  width = [UILabel getSpaceLabelWidth:text] +20;
        //        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width/2+jianxi, height)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        [label setText:text];
        label.textAlignment = NSTextAlignmentCenter;
        //        label.tag = i+10;
        label.textColor =[UIColor colorWithHexString:@"#888888"];
        label.font = [UIFont systemFontOfSize:14];
        [view addSubview:label];
        UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(7, height-1, width-14, 1)];
        //        lineView.centerX = label.centerX;
        lineView.backgroundColor = [UIColor blueColor];
        [view addSubview:lineView];
        lineView.hidden = YES;
        //        [view addSubview:image];
        [self addSubview:view];
        tempX += width;
        
        // 1. 创建一个点击事件，点击时触发labelClick方法
        UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)];
        // 2. 将点击事件添加到label上
        [view addGestureRecognizer:labelTapGestureRecognizer];
        view.userInteractionEnabled = YES;
        if (i == 0) {
            [self  addbottomLineviewLabel:view];
        }
        [arr_tagscrollView addObject:view];
        
    }
    
    CGSize size = self.contentSize;
    size.width = tempX;
    //设置不显示横拉动条
    self.showsHorizontalScrollIndicator = NO;
    //showsVerticalScrollIndicator 设置竖滚动条是否显示
    self.contentSize = size;
    //设置反弹效果
    self.bounces = YES;
    //pagingEnabled
    //当值是YES,会自动滚动到subview的边界,默认是NO
    //scrollEnabled
    //决定是否可以滚动
    //navigationController 默认为yes 自动调整uiscrollview的高度inset大小
    
//    float a = self.contentSize.width;
//    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, a, 1.5)];
//    UIView * botomView = [[UIView alloc]initWithFrame:CGRectMake(0, height, SCREEN_WIDTH, 1.5)];
//    topView.backgroundColor = [UIColor colorWithHexString:@"#f1f1f1"];
//    botomView.backgroundColor = [UIColor colorWithHexString:@"#f1f1f1"];
//    [self addSubview:botomView];
    //    [self.view addSubview:botomView];
    
}
-(void)addbottomLineviewLabel:(UIView *)view{
    NSArray * arr_view = view.subviews;
    UIImageView * image;
    UILabel *label;
    UIView * lineView;
    for (int i = 0; i<arr_view.count; i++) {
        if ([arr_view[i] isKindOfClass:[UIImageView class]]) {
            image = arr_view[i];
        }else if([arr_view[i] isKindOfClass:[UILabel class]]){
            label = arr_view[i];
        }else if([arr_view[i] isKindOfClass:[UIView class]]){
            lineView = arr_view[i];
        }
    }
    lineView.hidden = NO;
    label.textColor = [UIColor blueColor];
    image.image = [UIImage imageNamed:@"eat-fanhui"];
//    [image sd_setImageWithURL:[NSURL URLWithString:ImageUrl(k_arrow)] placeholderImage:[UIImage imageNamed:@"ck_gray_arrow"]];
//    [_last_image sd_setImageWithURL:[NSURL URLWithString:ImageUrl(k_un_arrow)] placeholderImage:[UIImage imageNamed:@"ck_gray_arrow"]];
//    _last_image.image = [UIImage imageNamed:@"ck_gray_arrow"];
    last_label.textColor = [UIColor colorWithHexString:@"#888888"];
    last_lineView.hidden = YES;
    last_label = label;
    last_image = image;
    last_lineView =lineView;
    
}
-(void)labelClick:(UITapGestureRecognizer *)recognizer{
    
    UIView *view=(UIView*)recognizer.view;
    NSArray * arr_view = view.subviews;
    UIImageView * image;
    UILabel *label;
    UIView * lineView;
    for (int i = 0; i<arr_view.count; i++) {
        if ([arr_view[i] isKindOfClass:[UIImageView class]]) {
            image = arr_view[i];
        }else if([arr_view[i] isKindOfClass:[UILabel class]]){
            label = arr_view[i];
        }else if([arr_view[i] isKindOfClass:[UIView class]]){
            lineView = arr_view[i];
        }
    }
    if ([last_label isEqual:label]) {
        return;
    }
    
    if ([self.sdelegate respondsToSelector:@selector(touchActive:labeltext:touchCount:)]) {
        [self.sdelegate touchActive:self labeltext:label.text touchCount:view.tag -10];
    }
    [self  addbottomLineviewLabel:view];
    
    
}
-(void)setTextArray:(NSArray *)textArray{
    _textArray  = textArray;
    [self setscrollViewWithArray:textArray];
}
-(NSMutableArray *)arr_tagscrollView{
    if (!arr_tagscrollView) {
        arr_tagscrollView = [NSMutableArray array];
    }
    return arr_tagscrollView;
}


@end
