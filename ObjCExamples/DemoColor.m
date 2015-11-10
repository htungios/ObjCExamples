//
//  DemoColor.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 11/10/2558 BE.
//  Copyright (c) 2558 HoangNgocTung. All rights reserved.
//

#import "DemoColor.h"
#import "UIColor+HexColor.h"

@interface DemoColor ()

@end

@implementation DemoColor

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 40, 100)];
    label.backgroundColor = [[UIColor alloc] initWithHex:@"ECD078" alpha:1];
    [self.view addSubview:label];
}

@end
