//
//  RollingBall.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 11/11/2558 BE.
//  Copyright (c) 2558 HoangNgocTung. All rights reserved.
//

#import "RollingBall.h"

@interface RollingBall ()

@end

@implementation RollingBall
{
    UIImageView* ball;
    NSTimer* timer;
    CGFloat angle;
    CGFloat ballRadius;
    CGFloat deltaAngle;
    CGSize mainViewSize;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    ballRadius = 64;
    mainViewSize = self.view.bounds.size;
    [self addBall];
    
    angle = 0.0;
    deltaAngle = 0.03;
   
    
    
    if (( ball.center.x - ballRadius) <= (ballRadius * deltaAngle)  ) {
    timer =[NSTimer scheduledTimerWithTimeInterval:0.05
                                           target:self
                                         selector:@selector(rollBall)
                                         userInfo:nil
                                          repeats:true];
    }
   
}
- (void) addBall {
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball"]];
    ball.center = CGPointMake(ballRadius, mainViewSize.height * 0.5);
    [self.view addSubview:ball];
    
}

- (void) rollBall {
        angle += deltaAngle;
        ball.transform = CGAffineTransformMakeRotation(angle);
        ball.center = CGPointMake(ball.center.x + ballRadius * deltaAngle, ball.center.y);
    if ((mainViewSize.width - ball.center.x - ballRadius) <= (ballRadius * deltaAngle)) {
        [timer invalidate];
        timer =[NSTimer scheduledTimerWithTimeInterval:0.05
                                                target:self
                                              selector:@selector(rollBall1)
                                              userInfo:nil
                                               repeats:true];
                }
            }

- (void) rollBall1 {
    angle -= deltaAngle;
    ball.transform = CGAffineTransformMakeRotation(angle);
    ball.center = CGPointMake(ball.center.x - ballRadius * deltaAngle, ball.center.y);
    if ((ball.center.x - ballRadius) <= (ballRadius * deltaAngle)) {
        [timer invalidate];
        timer =[NSTimer scheduledTimerWithTimeInterval:0.05
                                                target:self
                                              selector:@selector(rollBall)
                                              userInfo:nil
                                               repeats:true];

    }
    
}


- (void) viewWillDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [timer invalidate];
    timer = nil;
}

@end
