//
//  Style309TableViewCell.h
//  CCTVPoint
//
//  Created by 刘茜童 on 2016/12/22.
//  Copyright © 2016年 刘茜童. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import <WebKit/WebKit.h>
#import "UIView+Extension.h"
@protocol Style309TableViewCellDelegate <NSObject>

-(void)clickPlayerBtn:(id)obj;
-(void)clickRepalyeBtnDelegate:(id)obj;
-(void)clickSaveBtnDelegate:(id)obj;
-(void)clickShareBtnDelegate:(id)obj;

@end

@interface Style309TableViewCell : UITableViewCell<WKUIDelegate,WKNavigationDelegate>

{
    CGFloat currentBottom;
}
@property (nonatomic,assign) id<Style309TableViewCellDelegate> delegate;
@property (nonatomic,strong) UIImageView *videoView;
@property (nonatomic,strong) UIView *rePlayerView;
@property (nonatomic,strong) UIButton *playBtn;
@property (nonatomic,strong) UIButton *replayBtn;
@property (nonatomic,strong) UIButton *saveBtn;
@property (nonatomic,strong) UIButton *shareBtn;

@property (nonatomic, strong) WKWebView *webview;
@property (nonatomic, assign) CGFloat webviewHeight;

@property (nonatomic, assign) BOOL isZWGJDetail;

+(instancetype)cellWithTableView:(UITableView*)tableView;
-(void)setCellWithArray:(NSArray*)array;
-(CGFloat)setHeightWithArray:(NSArray *)array;
/** 播放按钮block */
//@property (nonatomic, copy) PlayBtnCallBackBlock playBlock;

//@property (nonatomic,strong) ZFPlayerView *playerView;

@end
