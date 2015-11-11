//
//  Color.h
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 11/11/2558 BE.
//  Copyright (c) 2558 HoangNgocTung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Color : UIView
- (instancetype) initWithHex : (NSString*) hex
                       alpha : (CGFloat) alpha
                       frame : (CGRect) rect ;

- (void) fadeOut ; // hieu ung lam mo

@property (nonatomic, strong) NSString* hex ;

@end
