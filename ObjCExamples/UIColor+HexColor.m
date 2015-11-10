//
//  UIColor+HexColor.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 11/10/2558 BE.
//  Copyright (c) 2558 HoangNgocTung. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)
- (instancetype) initWithHex : (NSString*) hex
                       alpha : (float) alpha {
    CGFloat alphaValue =1;
    if (alpha >=0 && alpha < 1) {
        alphaValue = alpha;
    }
    NSString *validHexChars = @"abcdefABCDEF0123456789";
    NSMutableString *filterHex = [[NSMutableString alloc] initWithCapacity:6];
    
    for (int i = 0; i < hex.length; i++) {
        unichar charFromInput = [hex characterAtIndex:i];
        NSString *hexChar = [NSString stringWithFormat:@"%c", charFromInput];
        if ([validHexChars rangeOfString:hexChar
                                 options:NSCaseInsensitiveSearch].location != NSNotFound) {
            [filterHex appendString:hexChar];
        }
    }
    if (filterHex.length ==6) {
        unsigned long long colorValue = 0;
        NSScanner *scanner = [[NSScanner alloc] initWithString:filterHex];
        [scanner scanHexLongLong:&colorValue];
        
        CGFloat red = (CGFloat) ((colorValue & 0xFF0000) >> 16) / 255 ;
        CGFloat green = (CGFloat) ((colorValue & 0x00FF00) >> 8) / 255 ;
        CGFloat blue = (CGFloat) ((colorValue & 0x0000FF)) / 255;
        return [self initWithRed: red
                           green: green
                            blue: blue
                           alpha: alpha];
    }
    return [self initWithRed: 0
                       green: 0
                        blue: 0
                       alpha: alpha];
}

@end
