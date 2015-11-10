//
//  UIColor+HexColor.h
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 11/10/2558 BE.
//  Copyright (c) 2558 HoangNgocTung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)
- (instancetype) initWithHex : (NSString*) hex
                       alpha : (float) alpha;
@end
