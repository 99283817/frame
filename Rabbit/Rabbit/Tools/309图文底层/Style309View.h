//
//  Style309View.h
//  CCTVPoint
//
//  Created by 刘茜童 on 2017/6/22.
//  Copyright © 2017年 刘茜童. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Style309ViewDelegate <NSObject>

-(void)updateHeaderView;

-(void)openNewPageFrom309:(NSString *)urlString;

-(void)clickPlayerBtn:(id)obj;
-(void)clickRepalyeBtnDelegate:(id)obj;
-(void)clickSaveBtnDelegate:(id)obj;
-(void)clickShareBtnDelegate:(id)obj;

@end

@interface Style309View : UIView

@property (nonatomic, assign) id<Style309ViewDelegate> delegate;
@property (nonatomic, strong) UIImageView *videoView;
@property (nonatomic, strong) UIButton *playBtn;
@property (nonatomic, strong) UIButton *replayBtn;
@property (nonatomic, strong) UIButton *saveBtn;
@property (nonatomic, strong) UIButton *shareBtn;

- (instancetype)initWithArray:(NSArray *)array;

//- (void)changeViewWithWebviewHeight:(CGFloat)webviewHeight;

- (void)removeObserve;

@end
