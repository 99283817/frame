//
//  Style309TableViewCell.m
//  CCTVPoint
//
//  Created by 刘茜童 on 2016/12/22.
//  Copyright © 2016年 刘茜童. All rights reserved.
//

#import "Style309TableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "UIImageView+WebCache.h"

#define KVNewsType @"KVNewsType"
#define KVContent @"KVContent"
#define KVNewsTypeHeadPic @"KVNewsTypeHeadPic"
#define KVNewsTypeTitle @"KVNewsTypeTitle"
#define KVNewsTypeDate @"KVNewsTypeDate"
#define KVNewsTypeTag @"KVNewsTypeTag"
#define KVNewsTypeDetail @"KVNewsTypeDetail"
#define KVNewsTypePic @"KVNewsTypePic"
#define KVNewsTypeVideo @"KVNewsTypeVideo"

#define KVNewsTypeZWGJDate @"KVNewsTypeZWGJDate"
#define KVNewsTypeZWGJTag @"KVNewsTypeZWGJTag"


#define kVideoViewTag 8000
#define kPlayBtnTag 8001
#define kSaveBtnTag 8002
#define kShareBtnTag 8003
#define kReplayBtnTag 8004
#define kRePlayerViewTag 8005

@implementation Style309TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)cellWithTableView:(UITableView*)tableView{
    static NSString *identifier = @"style309";
    
    Style309TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[Style309TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(CGFloat)setHeightWithArray:(NSArray *)array{
    CGFloat cellHeight=0;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat width = screenWidth-20;
    if (self.isZWGJDetail) {
        width = screenWidth-40;
    }
    for (int i=0; i<array.count; ++i) {
        NSDictionary *dict = array[i];
        NSString *typeStr = [dict objectForKey:KVNewsType];
        NSString *topImageStr = @"";
        NSString *titleStr = @"";
        NSString *timeStr = @"";
//        NSString *tagStr = @"";
        NSString *contentStr = @"";
        NSString *imageStr = @"";
        NSString *videoStr = @"";
        if ([typeStr isEqualToString:KVNewsTypeHeadPic]) {
            topImageStr = [dict objectForKey:KVContent];
        }
        if ([typeStr isEqualToString:KVNewsTypeTitle]) {
            titleStr = [dict objectForKey:KVContent];
        }
        if ([typeStr isEqualToString:KVNewsTypeDate]) {
            timeStr = [dict objectForKey:KVContent];
        }
        if ([typeStr isEqualToString:KVNewsTypeDetail]) {
            contentStr = [dict objectForKey:KVContent];
        }
        if ([typeStr isEqualToString:KVNewsTypePic]) {
            imageStr = [dict objectForKey:KVContent];
        }
        if ([typeStr isEqualToString:KVNewsTypeVideo]) {
            videoStr = [dict objectForKey:KVContent];
        }
        
        if (![topImageStr isEqualToString:@""]) {

            NSNumber *a = [dict objectForKey:@"imageWidth"];
            NSNumber *b = [dict objectForKey:@"imageHeight"];
            CGFloat imageheight;
            if ([b intValue] == 0) {
                imageheight=0;
            }else{
                imageheight = width*[b floatValue]/[a floatValue];
            }
            
            cellHeight = imageheight;
        }
        if (![titleStr isEqualToString:@""]) {

            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, currentBottom+20, width, /*sizeA.height*/10)];
            if (self.isZWGJDetail) {
                titleLabel.left = 20;
            }
            titleLabel.font = [UIFont boldSystemFontOfSize:23];
            titleLabel.numberOfLines = 2;
            titleLabel.text = titleStr;
            [titleLabel sizeToFit];
            
            cellHeight = cellHeight+20+titleLabel.height;
        }
        if (![timeStr isEqualToString:@""]) {
            
            NSString *labelStr = @"";
//            if ([NSString stringIsEmpty:tagStr]) {
                labelStr = timeStr;
//            }else{
//                labelStr = [NSString stringWithFormat:@"%@   %@",tagStr,timeStr];
//            }
            
//            CGSize sizeA = [labelStr sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];
            CGSize sizeA;
            cellHeight = cellHeight+10+sizeA.height;
        }
        if (![contentStr isEqualToString:@""]) {
            
            cellHeight = cellHeight+self.webviewHeight;

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
            cellHeight = cellHeight+10+imageheight+0;
        }
        if (![videoStr isEqualToString:@""]) {
            cellHeight = cellHeight+10+width*40/71+0;
        }
        
    }
    
    
    return cellHeight+40;
}


-(void)setCellWithArray:(NSArray*)array{
    NSString * contentStr =   @"<p style=\"text-align: center;\"><video src=\"http://vjs.zencdn.net/v/oceans.mp4\" controls=\"controls\">your browser does not support the video tag</video> width=\"100%\" height=\"auto\"/></p><p style=\"text-align: left;\">测试测试测试;</p><p style=\"text-align: left;\">测试测试测试测试测试测试;</p><p style=\"text-align: left;\">测试测试测试测试测试测试;</p><p style=\"text-align: left;\">测试测试测试测试测试测试;</p><p style=\"text-align: left;\">测试测试测试测试测试测试测试测试测试;</p><p style=\"text-align: left;\">测试测试测试;</p><p style=\"text-align: left;\">测试测试测试测试测试测试</p><p style=\"text-align: left;\">测试测试测试;测试测试测试</p><p>测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</p><p style=\"text-align: center;\"><img src=\"http://pic.5club.cctv.cn/photoAlbum/page/performance/img/2016/9/5/1473055593053_776.gif\" width=\"100%\" height=\"auto\"/></p><p>测试测试测试测试测试测试</p><p style=\"text-align: center;\"><img src=\"http://pic.5club.cctv.cn/photoAlbum/page/performance/img/2016/9/5/1473055593112_672.jpg\" width=\"100%\" height=\"auto\"/></p><p>测试测试测试</p><p style=\"text-align: center;\"><img src=\"http://pic.5club.cctv.cn/photoAlbum/page/performance/img/2016/9/5/1473055593118_112.jpg\" width=\"100%\" height=\"auto\"/></p><p>测试测试测试测试测试测试</p><p style=\"text-align: center;\"><img src=\"http://pic.5club.cctv.cn/photoAlbum/page/performance/img/2016/9/5/1473055593125_443.gif\" width=\"100%\" height=\"auto\"/></p><p>测试测试测试</p><p style=\"text-align: center;\"><img src=\"http://pic.5club.cctv.cn/photoAlbum/page/performance/img/2016/9/5/1473055593166_611.gif\" width=\"100%\" height=\"auto\"/></p><p>测试测试测试测试测试测试</p><p style=\"text-align: center;\"><img src=\"http://pic.5club.cctv.cn/photoAlbum/page/performance/img/2016/9/5/1473055593214_375.gif\" width=\"100%\" height=\"auto\"/></p><p>测试测试测试测试测试测试</p><p>测试测试测试</p>";
            int k_screen_width = [UIScreen mainScreen].bounds.size.width-10;
            NSString *js = [NSString stringWithFormat:@"function refreshView() {\
                            var imgstyle=document.getElementsByTagName('img');\
                            for(var i=0;i<imgstyle.length;i++){\
                            imgstyle[i].style.width='\%d'+'px';\
                            imgstyle[i].style.height = 'auto';\
                            }\
                            return document.getElementById('myid').offsetTop;\
                            }",k_screen_width];
            NSString *header = @"<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\"/><meta name=\"apple-mobile-web-app-capable\" content=\"yes\"><meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\"><link rel=\"stylesheet\" type=\"text/css\" /><style type=\"text/css\"> </style></head>";

            NSString *div = @"<div id='myid' style = 'width:100%;height:0px;background-color:white;display:block'></div>";
            NSString *html = [NSString stringWithFormat:@"<html>%@<body style='width:%@;background-color:white;padding:0px;margin:0px;display:block;'>%@%@</body></html>",header,@"100%",contentStr,div];
            
            WKUserScript *sc = [[WKUserScript alloc] initWithSource:js injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
            WKUserContentController *user = [[WKUserContentController alloc] init];
            [user addUserScript:sc];
            WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
            [config setUserContentController:user];
            self.webview = [[WKWebView alloc] initWithFrame:CGRectMake(5, currentBottom+10, [UIScreen mainScreen].bounds.size.width-10, 10) configuration:config];

            if (self.isZWGJDetail) {
                
                self.webview.left = 10;
                self.webview.width = SCREEN_WIDTH-20;
            }
            self.webview.scrollView.showsVerticalScrollIndicator = NO;
            self.webview.navigationDelegate = self;
            self.webview.UIDelegate = self;
            self.webview.userInteractionEnabled = NO;
//            self.webview.dataDetectorTypes = UIDataDetectorTypeNone;//&&限制某些数字变蓝色
            //不滚动
            UIScrollView *questScrollView =  [self.webview.subviews objectAtIndex:0];
            questScrollView.scrollEnabled = NO;
            
            [self.contentView addSubview:self.webview];
            
            
            
            [self.webview loadHTMLString:html baseURL:nil];
            
            currentBottom = currentBottom+self.webviewHeight;
            
            //                NSString *htmlString=@"<img src=\"http://pic.5club.cctv.cn/photoAlbum/page/performance/img/2016/9/5/1473055593053_776.gif\" width=\"100%\" height=\"auto\"/>";
//
           
            
//            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//            NSString *cachesDirectory = [paths objectAtIndex:0];
//            NSString *downloadDirectory = [cachesDirectory stringByAppendingPathComponent:@"CCTVPointNewsDetail"];
//            NSString *nameDicStr = [contentStr stringByReplacingOccurrencesOfString:@"://" withString:@""];
//            NSString *downloadPath = [downloadDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.html",nameDicStr]];
//
//            NSString* path = [[NSBundle mainBundle] pathForResource:@"testnew" ofType:@"html"];
//            NSURL* fileUrl = [NSURL fileURLWithPath:path];
//
//            NSData *data = [NSData dataWithContentsOfFile:path];
//            [self.webview loadData:data MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL fileURLWithPath:path]];
//
//            NSURLRequest *request = [NSURLRequest requestWithURL:fileUrl];
//            
//            NSURLResponse *respnose = nil;
//            
//            NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&respnose error:NULL];
//            
//            NSLog(@"%@", respnose.MIMEType);
//            
//            [self.webview loadData:data MIMEType:respnose.MIMEType textEncodingName:@"UTF8" baseURL:[NSURL URLWithString:@"www.baidu.com"]];
   
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
/*
    if ([KVGlobelObject shareInstance].isNet == NO) {
        [[iToast makeText:@"网络异常"] show];
        return;
    }
  */  
    if ([_delegate respondsToSelector:@selector(clickPlayerBtn:)]) {
        [_delegate performSelector:@selector(clickPlayerBtn:) withObject:self];
    }
}


#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
//     [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '150%'" completionHandler:nil];
    
    [webView evaluateJavaScript:@"refreshView()" completionHandler:^(id _Nullable obj, NSError * _Nullable error) {
        //防止死循环
        if (!self.webview.isLoading) {
            CGFloat height = [obj floatValue];
            CGRect frame = self.webview.frame;
            frame.size.height = height;
            self.webview.frame = frame;
            
            NSDictionary *dic = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:height] forKey:@"webviewHeight"];
            
            // 用通知发送加载完成后的高度
            [[NSNotificationCenter defaultCenter] postNotificationName:@"WEBVIEW_HEIGHT" object:self userInfo:dic];
            
        }else{
            
        }
    }];
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    NSLog(@"%@",navigationResponse.response.URL.absoluteString); //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow); //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
    
}

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@"%@",navigationAction.request.URL.absoluteString);
    //允许跳转//    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许跳转 //decisionHandler(WKNavigationActionPolicyCancel);
    
    NSURL *requestURL =navigationAction.request.URL;
    if (([[requestURL scheme] isEqualToString: @"http"] || [[requestURL scheme] isEqualToString:@"https"] || [[requestURL scheme] isEqualToString: @"mailto" ])
        && (navigationAction.navigationType == WKNavigationTypeLinkActivated)) {
        if (![[UIApplication sharedApplication] openURL:requestURL]) {
            
        }else{
            //不允许跳转 //
            decisionHandler(WKNavigationActionPolicyCancel);
            
        };
    }
    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
