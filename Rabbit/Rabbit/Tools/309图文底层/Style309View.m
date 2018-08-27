//
//  Style309View.m
//  CCTVPoint
//
//  Created by 刘茜童 on 2017/6/22.
//  Copyright © 2017年 刘茜童. All rights reserved.
//

#import "Style309View.h"
#import "UIImageView+WebCache.h"
//#import "ZFPlayer.h"
#import <WebKit/WebKit.h>
#import "UIView+Extension.h"

#define kVideoViewTag 8000
#define kPlayBtnTag 8001
#define kSaveBtnTag 8002
#define kShareBtnTag 8003
#define kReplayBtnTag 8004
#define kRePlayerViewTag 8005

static char imgUrlArrayKey;

@interface Style309View()<UIWebViewDelegate,WKNavigationDelegate>

@property (nonatomic, assign) CGFloat currentBottom;
@property (nonatomic, strong) NSArray *array;
//@property (nonatomic, strong) UIWebView *webview;
@property (nonatomic, strong) WKWebView *webview;

@property (nonatomic, strong) NSMutableArray *imageArray;

@end

@implementation Style309View

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        
        self.array = [NSArray arrayWithArray:array];
        self.imageArray = [NSMutableArray array];
        
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat width = screenWidth-20;
//        if (self.isZWGJDetail) {
//            width = screenWidth-40;
//        }
        self.currentBottom=0;
        
        NSString *videoImageUrl;
        for (int i=0; i<array.count; ++i) {
            NSDictionary *dict = array[i];
            
            
            NSString *topImageStr = @"";
            NSString *titleStr = @"";
            NSString *timeStr = @"";
            NSString *contentStr = @"";
            NSString *imageStr = @"";
            NSString *videoStr = @"";
            NSString *channelStr = @"";
            NSString *lanmuStr = @"";
         
            
            NSString *timeStrRight = @"";//中文国际中右侧的时间（左侧是来源-用了字段timeStr）

            
            if (![topImageStr isEqualToString:@""]) {
                
                NSNumber *a = [dict objectForKey:@"imageWidth"];
                NSNumber *b = [dict objectForKey:@"imageHeight"];
                CGFloat imageheight;
                if ([b intValue] == 0) {
                    imageheight=0;
                }else{
                    imageheight = width*[b floatValue]/[a floatValue];
                }
                
                UIImageView *topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.currentBottom, width, imageheight)];
//                if (self.isZWGJDetail) {
//                    topImageView.left = 20;
//                }
                
                [topImageView sd_setImageWithURL:[NSURL URLWithString:topImageStr] placeholderImage:[UIImage imageNamed:@"placeholderImage"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    
                   
                    
                }];
                
                
                
                videoImageUrl = topImageStr;
                [self addSubview:topImageView];
                
            }
            if (![channelStr isEqualToString:@""]) {
                
                UILabel *channelLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.currentBottom+20, width, /*sizeA.height*/10)];
                channelLabel.font = [UIFont systemFontOfSize:13];
                
                channelLabel.numberOfLines = 1;
                channelLabel.text = channelStr;
                [channelLabel sizeToFit];
                [self addSubview:channelLabel];
                
            }
            if (![titleStr isEqualToString:@""]) {
                
                UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.currentBottom+10, width, /*sizeA.height*/10)];
//                if (self.isZWGJDetail) {
//                    titleLabel.left = 20;
//                }
                titleLabel.font = [UIFont boldSystemFontOfSize:23];
                
                titleLabel.numberOfLines = 2;
                titleLabel.text = titleStr;
                [titleLabel sizeToFit];
                [self addSubview:titleLabel];
                
            }
            if (![lanmuStr isEqualToString:@""]) {
//                CGSize sizeA = [lanmuStr sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];
//                CGSize size = [lanmuStr boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin  attributes:NSLineBreakByCharWrapping context:NSLineBreakByCharWrapping];
                CGSize sizeA;
                UILabel *lanmuLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.currentBottom+10, sizeA.width, sizeA.height)];
                lanmuLabel.font = [UIFont systemFontOfSize:13];
                
                lanmuLabel.textAlignment = NSTextAlignmentRight;
                lanmuLabel.text = lanmuStr;

                [self addSubview:lanmuLabel];
                
            }
            if (![timeStr isEqualToString:@""] || ![timeStrRight isEqualToString:@""]) {
                

//                if (self.isZWGJDetail) {
//                    CGSize sizeAA = [timeStrRight sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];
//                    UILabel *timeLabelRight = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth-20-sizeAA.width, currentBottom+10, sizeAA.width, sizeAA.height)];
//                    timeLabelRight.font = [UIFont systemFontOfSize:13];
//                    timeLabelRight.textColor = [UIColor colorWithHexString:@"999999"];
//                    timeLabelRight.textAlignment = NSTextAlignmentRight;
//                    
//                    timeLabelRight.text = timeStrRight;
//                    [self.contentView addSubview:timeLabelRight];
//                }
                
            }
            if (![contentStr isEqualToString:@""]) {
                
                //uiwebview
//                self.webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, self.currentBottom+10, [UIScreen mainScreen].bounds.size.width-0, 1)];
////                if (self.isZWGJDetail) {
////                    self.webview.left = 10;
////                    self.webview.width = screenWidth-20;
////                }
//                self.webview.delegate = self;
//                self.webview.userInteractionEnabled = NO;
//                self.webview.dataDetectorTypes = UIDataDetectorTypeNone;//&&限制某些数字变蓝色
//                //不滚动
//                UIScrollView *questScrollView =  [self.webview.subviews objectAtIndex:0];
//                questScrollView.scrollEnabled = NO;
//                
//                self.webview.backgroundColor = [UIColor whiteColor];
//                self.webview.opaque = NO;
//                [self addSubview:self.webview];
//                
//                self.currentBottom = self.currentBottom+self.webview.height+10;
//
//                
//                [self.webview loadHTMLString:contentStr baseURL:nil];
//                
//                [self.webview.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];

                //wkwebview
                //初始化一个WKWebViewConfiguration对象
                WKWebViewConfiguration *config = [WKWebViewConfiguration new];
                //初始化偏好设置属性：preferences
                config.preferences = [WKPreferences new];
                //The minimum font size in points default is 0;
//                config.preferences.minimumFontSize = 10;
                //是否支持JavaScript
//                config.preferences.javaScriptEnabled = YES;
                //不通过用户交互，是否可以打开窗口
//                config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
                
                self.webview = [[WKWebView alloc] initWithFrame:CGRectMake(10, self.currentBottom+10, [UIScreen mainScreen].bounds.size.width-20, 1) configuration:config];

                self.webview.navigationDelegate = self;
                self.webview.userInteractionEnabled = YES;
//                self.webview.dataDetectorTypes = UIDataDetectorTypeNone;//&&限制某些数字变蓝色
                //不滚动
                UIScrollView *questScrollView =  [self.webview.subviews objectAtIndex:0];
                questScrollView.showsHorizontalScrollIndicator = NO;
//                questScrollView.scrollEnabled = NO;
                
                self.webview.backgroundColor = [UIColor whiteColor];
                self.webview.opaque = NO;
                
                //不横向滚动
                NSString *jScript = @"var meta = document.createElement('meta'); \
                meta.name = 'viewport'; \
                meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'; \
                var head = document.getElementsByTagName('head')[0];\
                head.appendChild(meta);";
                WKUserScript *wkUScript = [[NSClassFromString(@"WKUserScript") alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:NO];
                [self.webview.configuration.userContentController addUserScript:wkUScript];
                
                
                [self addSubview:self.webview];
                
                self.currentBottom = self.currentBottom+self.webview.height+10;
                
                [self.webview loadHTMLString:contentStr baseURL:nil];
                
                [self.webview.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];

                
            }
            if (![imageStr isEqualToString:@""]) {
                
                NSNumber *a = [dict objectForKey:@"imageWidth"];
                NSNumber *b = [dict objectForKey:@"imageHeight"];
                CGFloat imageheight;
                if ([b intValue] == 0) {
                    imageheight=0;
                }else{
                    imageheight = width*[b floatValue]/[a floatValue];
                }
                
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.currentBottom+10, width, imageheight)];
                
                [imageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:[UIImage imageNamed:@"placeholderImage"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    
                    if (error) {
                        [imageView setImage:[UIImage imageNamed:@"placeholderImage"]];
                    }else {
                        
                        SDWebImageManager *manager = [SDWebImageManager sharedManager];
                        if (2) {
                            NSLog(@"不加载动画");
                        }else {
                            //imageView.alpha = 0.0;
                            [UIView transitionWithView:imageView
                                              duration:1.0
                                               options:UIViewAnimationOptionTransitionCrossDissolve
                                            animations:^{
                                                [imageView setImage:image];
                                                //imageView.alpha = 1.0;
                                            } completion:NULL];
                        }
                    }
                }];
                
                
                if (videoImageUrl.length == 0) {
                    videoImageUrl = imageStr;
                }
                [self addSubview:imageView];
                self.currentBottom = imageView.bottom+0;
            }
            if (![videoStr isEqualToString:@""]) {
                
                _videoView = (UIImageView *)[self viewWithTag:kVideoViewTag];
                if (_videoView == nil) {
                    _videoView = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.currentBottom+10, width, width*40/71)];
                    _videoView.tag = kVideoViewTag;
                    [_videoView sd_setImageWithURL:[NSURL URLWithString:videoImageUrl] placeholderImage:[UIImage imageNamed:@"placeholderImage"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                        if (error) {
                            [self->_videoView setImage:[UIImage imageNamed:@"placeholderImage"]];
                        }else  {
                            
                            SDWebImageManager *manager = [SDWebImageManager sharedManager];
                            if (1) {
                                NSLog(@"不加载动画");
                            }else {
                                //_videoView.alpha = 0.0;
                                [UIView transitionWithView:self.videoView
                                                  duration:1.0
                                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                                animations:^{
                                                    [self.videoView setImage:image];
                                                    // _videoView.alpha = 1.0;
                                                } completion:NULL];
                            }
                        }
                    }];
                    
                    
                    [self addSubview:_videoView];
                    
//                    [[ZFPlayerView sharedPlayerView] resetPlayer];
                }
                
//                if (self.height==0) {
//                    _videoView.hidden = YES;
//                }else{
//                    _videoView.hidden = NO;
//                }
                
                _videoView.userInteractionEnabled = YES;
                
                
                _playBtn = (UIButton *)[self viewWithTag:kPlayBtnTag];
                if (_playBtn == nil) {
                    _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                    _playBtn.frame = CGRectMake(_videoView.width/2 - 25, _videoView.height/2 - 25, 50, 50);
                    _playBtn.tag = kPlayBtnTag;
                    [_playBtn setImage:[UIImage imageNamed:@"video"] forState:UIControlStateNormal];
                    [_playBtn addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
                    [_videoView addSubview:_playBtn];
                }
                
                _replayBtn = [self viewWithTag:kReplayBtnTag];
                if (_replayBtn == nil) {
                    _replayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                    _replayBtn.tag = kReplayBtnTag;
                    _replayBtn.backgroundColor = [UIColor blackColor];
                    _replayBtn.alpha = 0.4;
                    _replayBtn.frame = CGRectMake((_videoView.frame.size.width - 50)/2, _videoView.height/2 - 25, 50, 50);
                    _replayBtn.hidden = YES;
                    [_replayBtn addTarget:self action:@selector(clickReplayBtn:) forControlEvents:UIControlEventTouchUpInside];
                    [_replayBtn setImage:[UIImage imageNamed:@"repeat_video"] forState:UIControlStateNormal];
                    [_videoView addSubview:_replayBtn];
                }
                
                _saveBtn = (UIButton *)[self viewWithTag:kSaveBtnTag];
                if (_saveBtn == nil) {
                    _saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                    _saveBtn.frame = CGRectMake(_videoView.width/2 -25, _videoView.height/2 - 25, 50, 50);
                    _saveBtn.backgroundColor = [UIColor blackColor];
                    _saveBtn.alpha = 0.4;
                    _saveBtn.tag = kSaveBtnTag;
                    _saveBtn.hidden = YES;
                    [_saveBtn addTarget:self action:@selector(clickSaveBtn:) forControlEvents:UIControlEventTouchUpInside];
                    [_videoView addSubview:_saveBtn];
                }
                
                
                _shareBtn = (UIButton *)[self viewWithTag:kShareBtnTag];
                if (_shareBtn == nil) {
                    _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                    _shareBtn.frame = CGRectMake(CGRectGetMaxX(_saveBtn.frame) + (_videoView.frame.size.width - 50*3)/4, _videoView.height/2 - 25, 50, 50);
                    _shareBtn.backgroundColor = [UIColor blackColor];
                    _shareBtn.alpha = 0.4;
                    _shareBtn.tag = kShareBtnTag;
                    _shareBtn.hidden = YES;
                    [_shareBtn setImage:[UIImage imageNamed:@"fshare"] forState:UIControlStateNormal];
                    [_shareBtn addTarget:self action:@selector(clickShareBtn:) forControlEvents:UIControlEventTouchUpInside];
                    [_videoView addSubview:_shareBtn];
                }
                
                self.currentBottom = _videoView.bottom+0;
            }
        }

        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.currentBottom);
        
    }
    return self;
}

-(void)clickReplayBtn:(UIButton *)btn
{
    NSLog(@"clickReplayBtn");
    
    if ([_delegate respondsToSelector:@selector(clickRepalyeBtnDelegate:)]) {
        [_delegate performSelector:@selector(clickRepalyeBtnDelegate:) withObject:self];
    }
    
}
-(void)clickSaveBtn:(UIButton *)btn
{
    NSLog(@"clickSaveBtn");
    if ([_delegate respondsToSelector:@selector(clickSaveBtnDelegate:)]) {
        [_delegate performSelector:@selector(clickSaveBtnDelegate:) withObject:self];
    }
}
-(void)clickShareBtn:(UIButton *)btn
{
    NSLog(@"clickShareBtn");
    if ([_delegate respondsToSelector:@selector(clickShareBtnDelegate:)]) {
        [_delegate performSelector:@selector(clickShareBtnDelegate:) withObject:self];
    }
}
-(void)play:(UIButton *)sender
{
    NSLog(@"aaa");

    if ([_delegate respondsToSelector:@selector(clickPlayerBtn:)]) {
        [_delegate performSelector:@selector(clickPlayerBtn:) withObject:self];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{

    CGFloat height = webView.scrollView.contentSize.height;
    NSLog(@"finish:****************:%lf",height);
  
    if (self.webview.height<height) {
        
        self.currentBottom = self.currentBottom+height-self.webview.height;
        
        self.webview.height = height;
        
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.currentBottom);
        
        if ([self.delegate respondsToSelector:@selector(updateHeaderView)]) {
            [self.delegate performSelector:@selector(updateHeaderView) withObject:nil];
        }

        
    }

    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
    CGFloat height = webView.scrollView.contentSize.height;
    NSLog(@"finish:****************:%lf",height);
    
    if (self.webview.height<height) {
        
        self.currentBottom = self.currentBottom+height-self.webview.height;
        
        self.webview.height = height;
        
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.currentBottom);
        
        if ([self.delegate respondsToSelector:@selector(updateHeaderView)]) {
            [self.delegate performSelector:@selector(updateHeaderView) withObject:nil];
        }
        
        
    }
    
    //通过js获取htlm中图片url
    [self getImageUrlByJS:self.webview];
    //添加图片可点击js
    [self onClickByJS:self.webview];
    
}
#pragma mark 添加获取html中图片url的js
- (void)getImageUrlByJS:(WKWebView *)webview{
    
    //这里是js，主要目的实现对url的获取 body
    static  NSString * const jsGetImages = @"function getImages(){var objs = document.querySelectorAll(\"body img\");var imgScr = '';for(var i=0;i<objs.length;i++){imgScr = imgScr + objs[i].src + '+';}; return imgScr;};";
    
    [webview evaluateJavaScript:jsGetImages completionHandler:^(id Result, NSError * error) {
        NSLog(@"js___Result==%@",Result);
        NSLog(@"js___Error -> %@", error);
    }];
    
    [webview evaluateJavaScript:@"getImages()" completionHandler:^(id Result, NSError * error) {
        NSLog(@"urlResurlt==%@",Result);
        NSLog(@"js___Error -> %@", error);
        [self.imageArray addObjectsFromArray:[Result componentsSeparatedByString:@"+"]];
        if (self.imageArray.count >= 2) {
            [self.imageArray removeLastObject];
        }
        //urlResurlt 就是获取到得所有图片的url的拼接；imageArray就是所有Url的数组
    }];
    
}
#pragma mark 添加图片可点击js
- (void)onClickByJS:(WKWebView *)webview{
    
    static  NSString * const jsClickImages = @"function registerImageClickAction(){var objs = document.querySelectorAll(\"body img\");var img = '';for(var i=0;i<objs.length;i++){img = objs[i];img.onclick=function(){document.location.href='image-preview:'+this.src;};};};";
    
    [self.webview evaluateJavaScript:jsClickImages completionHandler:^(id Result, NSError * error) {
        NSLog(@"js___Result==%@",Result);
        NSLog(@"js___Error -> %@", error);
    }];
    [self.webview evaluateJavaScript:@"registerImageClickAction();" completionHandler:^(id Result, NSError * error) {
        NSLog(@"js___Result==%@",Result);
        NSLog(@"js___Error -> %@", error);
    }];
    
}

// 点击图片时会触发该回调
// 类似 UIWebView 的 -webView: shouldStartLoadWithRequest: navigationType:
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    //如果是跳转一个新页面
    if (navigationAction.targetFrame == nil) {
//        [webView loadRequest:navigationAction.request];
//        if ([self.delegate respondsToSelector:@selector(openNewPageFrom309:)]) {
//            [self.delegate performSelector:@selector(openNewPageFrom309:) withObject:[NSString stringWithFormat:@"%@",navigationAction.request.URL.absoluteString]];
//        }
        
    }
    
    if ([navigationAction.request.URL.scheme isEqualToString:@"image-preview"]) {
        NSString * imgUrl = [navigationAction.request.URL.absoluteString substringFromIndex:[@"image-preview:" length]];
        [imgUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        //imgUrl 就是被点击图片的url
        
        //添加图片展示层
        [self showBigImageViewWithImageUrl:imgUrl];
        
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

#pragma mark- 添加图片展示层
- (void)showBigImageViewWithImageUrl:(NSString *)imageUrl{
    
//    if (!self.myBigImageView) {
//        self.myBigImageView = [[MyBigImageView alloc] initWithArray:self.imageArray];
//        [self.myBigImageView setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
//        [[[UIApplication sharedApplication] keyWindow] addSubview:self.myBigImageView];
//    }
////    self.myBigImageView.hidden = NO;
////    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
//
//    [self.myBigImageView changeIndexWithImageUrl:imageUrl];

}
//- (void)configImageView:(NSString *)imageUrl{
//
//    //创建灰色透明背景，使其背后内容不可操作
//    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
//    [self.bgView setBackgroundColor:[UIColor blackColor]];
//    [[[UIApplication sharedApplication] keyWindow] addSubview:self.bgView];
//    
////    //创建边框视图
////    UIView *borderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-20, 240)];
////    //将图层的边框设置为圆脚
////    borderView.layer.cornerRadius = 8;
////    borderView.layer.masksToBounds = YES;
////    //给图层添加一个有色边框
////    borderView.layer.borderWidth = 8;
////    borderView.layer.borderColor = [[UIColor colorWithRed:0.9
////                                                    green:0.9
////                                                     blue:0.9
////                                                    alpha:0.7] CGColor];
////    [borderView setCenter:bgView.center];
////    [bgView addSubview:borderView];
//    
////    //创建关闭按钮
////    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
////    closeBtn.backgroundColor = [UIColor redColor];
////    [closeBtn addTarget:self action:@selector(removeBigImage) forControlEvents:UIControlEventTouchUpInside];
////    [closeBtn setFrame:CGRectMake(borderView.frame.origin.x+borderView.frame.size.width-20, borderView.frame.origin.y-6, 26, 27)];
////    [bgView addSubview:closeBtn];
//    
//    //创建显示图像视图
//    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(borderView.frame)-20, CGRectGetHeight(borderView.frame)-20)];
//    imgView.userInteractionEnabled = YES;
//    [imgView setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:LOAD_IMAGE(@"house_moren")];
//    [borderView addSubview:imgView];
//    
//    //添加捏合手势
//    [imgView addGestureRecognizer:[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinch:)]];
//
//}

#pragma mark- 注册webview高度观察者
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentSize"]) {
        
        //uiwebview
//        CGFloat height = [[self.webview stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"] floatValue];
//        
//        NSLog(@"observeValueForKeyPath:****************:%lf",height);
//        
//        if (self.webview.height<height) {
//
//            self.videoView.hidden = NO;
//            
//            self.currentBottom = self.currentBottom+height-self.webview.height;
//            
//            self.webview.height = height;
//            
//            self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.currentBottom);
//            
//            if ([self.delegate respondsToSelector:@selector(updateHeaderView)]) {
//                [self.delegate performSelector:@selector(updateHeaderView) withObject:nil];
//            }
//
//        }
        
        //wkwebview
        [self.webview evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
            
            CGFloat height = [result floatValue];
            
            if (self.webview.height<height) {
                
                self.videoView.hidden = NO;
                
                self.currentBottom = self.currentBottom+height-self.webview.height;
                
                self.webview.height = height;
                
                self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.currentBottom);
                
                if ([self.delegate respondsToSelector:@selector(updateHeaderView)]) {
                    [self.delegate performSelector:@selector(updateHeaderView) withObject:nil];
                }
                
            }
            
        }];

    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSURL *requestURL =[request URL];
    if (([[requestURL scheme] isEqualToString: @"http"] || [[requestURL scheme] isEqualToString:@"https"] || [[requestURL scheme] isEqualToString: @"mailto" ])
        && (navigationType == UIWebViewNavigationTypeLinkClicked)) {
        return ![[UIApplication sharedApplication] openURL:requestURL];
    }
    return YES;
}



- (void)removeObserve{
    
    @try {
        NSLog(@"removeremoveremove!!!");
        [self.webview.scrollView removeObserver:self forKeyPath:@"contentSize" context:nil];

    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}


@end
