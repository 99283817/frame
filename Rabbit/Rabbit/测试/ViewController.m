//
//  ViewController.m
//  Rabbit
//
//  Created by Rabbit on 2018/4/13.
//  Copyright © 2018年 Rabbit. All rights reserved.
//

#import "ViewController.h"
#import "TZcategoryScrollView.h"
#import <Masonry.h>
#import "TZtestViewController.h"
@interface ViewController ()<TZcategoryScrollViewDelete>
@property(nonatomic ,strong)NSArray *titleArr;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试";
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 200, SCREEN_WIDTH-20, 300)];
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview: view];
    
    UITapGestureRecognizer * gest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushview1)];
    [view addGestureRecognizer:gest];
    
    TZcategoryScrollView * csroView = [[TZcategoryScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    csroView.sdelegate = self;
//    csroView.pingfenCount = 2;
    csroView.isPingfen = YES;
//    csroView.isNoTextLengthShow = YES;
    csroView.textArray = @[@"112313",@"22223",@"312312",@"31231",@"11asd2313",@"asdkjasd",];
    [self.view addSubview:csroView];
    [csroView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view.mas_bottom);
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(45);
    }];
    // 表示本类支持旋转
//    [UIViewController attemptRotationToDeviceOrientation];
    
    [self initUIButtonView];
}
-(void)pushview1{
//    [self presentViewController:[TZtestViewController new] animated:YES completion:^{
    
//    }];
    [self.navigationController pushViewController:[TZtestViewController new] animated:YES];
    

}
-(void)touchActive:(TZcategoryScrollView *)scrollView labeltext:(NSString *)text touchCount:(NSInteger)num{
    NSLog(@"text = %@   num = %ld",text,(long)num);
}


-(void)initUIButtonView{
    
    _titleArr = @[@"人气",@"价格",@"桌数",@"优惠"];
    
    for (int i = 0; i < _titleArr.count; i ++) {
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *btn = [UIButton new];
        btn.frame = CGRectMake(10 + i * ((SCREEN_WIDTH - 50)/4 + 10) , 64, (SCREEN_WIDTH - 50)/4, 25);
        [btn setTitle:_titleArr[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
//        btn.showsTouchWhenHighlighted = YES;
        //设置tag值
        btn.tag = i + 100;
//        btn.selected = NO;
        [btn addTarget:self action:@selector(choose:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"eat-zan01"] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage imageNamed:@"button1"] forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor colorWithRed:170.0/255 green:107.0/255 blue:208.0/255 alpha:1] forState:UIControlStateSelected];
        [btn setImage:[UIImage imageNamed:@"eat-zan"] forState:UIControlStateSelected];
//        [btn setBackgroundImage:[UIImage imageNamed:@"button2"] forState:UIControlStateSelected];
        [self.view addSubview:btn];
    }
    
}
//人气、价格、作品数、优惠
- (void)choose:(UIButton *)sender{
    for (int i = 0; i < _titleArr.count; i++) {
        UIButton *btn = (UIButton *)[[sender superview]viewWithTag:100 + i];
        //选中当前按钮时
        if (sender.tag == btn.tag) {
            
            sender.selected = !sender.selected;
        }else{
            
            [btn setSelected:NO];
        }
    }
    
}



#pragma  mark 横屏设置

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
