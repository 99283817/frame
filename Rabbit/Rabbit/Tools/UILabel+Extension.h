//
//  UILabel+Extension.h
//  DynamicAcquisitionLableH
//
//  Created by app on 16/6/4.
//  Copyright © 2016年 app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

+(CGFloat)getSpaceLabelHeight:(NSString *)str withWidh:(CGFloat)width withFount:(NSInteger)fount;
+(CGFloat)getSpaceLabelWidth:(NSString *)str;
+(CGFloat)getSpaceLabelWidth:(NSString *)str withFount:(UIFont *)fount;
@end
