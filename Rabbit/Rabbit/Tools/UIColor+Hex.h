//
//  UIColor+Hex.h
//  bear
//
//  Created by 赵贝贝 on 2018/3/11.
//  Copyright © 2018年 ctvit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
/*
 @param hexString       NSString e.g @"0xFC5B13"
 @param alpha           alpha
 */

+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

+ (instancetype)colorWithHexString:(NSString *)hexString;

@end
