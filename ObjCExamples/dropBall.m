//
//  dropBall.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 11/13/2558 BE.
//  Copyright (c) 2558 HoangNgocTung. All rights reserved.
//

#import "dropBall.h"

@interface dropBall ()

@end

@implementation dropBall
{
    UIImageView *ball;
    CGFloat x, y, velocity, acceleration, ballRadius, maxHeight; // velocity : van toc, acceleration : gia toc;
    NSTimer *timer;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone; // toa do 0-0 o vi tri goc tren cung ben tay trai, truc Y huong xuong duoi, truc X tu trai sang phai.
    
    NSLog(@"%f", self.view.bounds.size.height);
    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil
                                            repeats:true];
    
    
}

- (void) addBall {
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball"]];
    ballRadius = 64;
    velocity = 0.0;
    acceleration = 0.98;
    x = mainViewSize.width * 0.5;
    y = ballRadius; // do toa do 0-0 o vi tri tren cung goc trai
    maxHeight = mainViewSize.height -  ballRadius - statusNavigationBarHeight ;
    NSLog(@"%f - %f - %f", maxHeight, mainViewSize.height, ballRadius);
    ball.center = CGPointMake(x, y);
    [self.view addSubview:ball];
}

- (void) dropBall {
    velocity += acceleration;
    y += velocity;
    if (y > maxHeight) {
        velocity = -velocity *0.9 ;
        y = maxHeight ;
        NSLog(@"%f", maxHeight);
    }
    NSLog(@"%f- %f",velocity,y);
    ball.center = CGPointMake(x, y);
    NSLog(@"222 %f", self.view.bounds.size.height);

    
}
- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [timer invalidate];
    timer = nil;
}

@end
