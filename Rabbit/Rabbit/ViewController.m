//
//  ViewController.m
//  Rabbit
//
//  Created by Rabbit on 2018/4/13.
//  Copyright © 2018年 Rabbit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 100, SCREEN_WIDTH-20, 300)];
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview: view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
