//
//  NSString+Null.h
//  Dopool
//
//  Created by vampire on 13-1-29.
//  Copyright (c) 2013年 vampire. All rights reserved.
//

//#import <Foundation/Foundation.h>
@import Foundation;
@interface NSString (Null)

+ (BOOL)stringIsEmpty:(NSString *)string;
+ (BOOL)stringIsInvalid:(NSString *)string;
- (BOOL)isValid;
- (BOOL)isValidUrl;
+ (BOOL)isValidateMobile:(NSString *)mobile;
+ (BOOL)isValidateEmail:(NSString *)email;
+ (BOOL)verifyIDCardNumber:(NSString *)value; //验证身份证

@end
