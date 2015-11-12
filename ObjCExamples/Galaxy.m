//
//  Galaxy.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 11/12/2558 BE.
//  Copyright (c) 2558 HoangNgocTung. All rights reserved.
//

#import "Galaxy.h"

@interface Galaxy ()

@end

@implementation Galaxy
{
    UIImageView *background;
    UIImageView *sun, *moon, *earth;
    CGFloat distanceEarthToSun, distanceMoonToEarth, angleE, angleM;
    CGPoint sunCenter;
    NSTimer *timer1, *timer2;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"galaxy"]];
    background.frame = self.view.bounds;
    [self.view addSubview:background];
    [self addSunEarthMoon];
    
    timer1 = [NSTimer scheduledTimerWithTimeInterval:0.0167
                                             target:self
                                           selector:@selector(spinEarth)
                                           userInfo:nil
                                            repeats:true];
    timer1 = [NSTimer scheduledTimerWithTimeInterval:0.0167
                                              target:self
                                            selector:@selector(spinMoon)
                                            userInfo:nil
                                             repeats:true];
    NSLog(@"W - %f H - %f", self.view.bounds.size.width, self.view.bounds.size.height);

}

- (void) addSunEarthMoon {
    CGSize mainViewSize;
    mainViewSize = self.view.bounds.size;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    sun = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Sun"]];
    sunCenter = CGPointMake(mainViewSize.width * 0.5, (mainViewSize.height + statusNavigationBarHeight) * 0.5);
    sun.center = sunCenter;
    [self.view addSubview:sun];
    
    distanceEarthToSun = mainViewSize.width * 0.393;
    distanceMoonToEarth = mainViewSize.width * 0.08;
    angleE = 0.0;
    angleM = 0.0;
    
    earth = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"earth"]];
    earth.center = [self computePositionOfEarth:angleE];
    [self.view addSubview:earth];
    
    moon =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"moon"]];
    moon.center = [self computePositionOfMoon:angleM];
    [self.view addSubview:moon];
    
}

- (CGPoint) computePositionOfEarth: (CGFloat) angle1 {
    return CGPointMake(sunCenter.x + distanceEarthToSun * cos(angle1) , sunCenter.y + distanceEarthToSun * sin(angle1));
    
}

- (CGPoint) computePositionOfMoon: (CGFloat) angle2 {
    return CGPointMake(earth.center.x  + distanceMoonToEarth * cos(angle2) , earth.center.y + distanceMoonToEarth * sin(angle2));
}

- (void) spinEarth {
    angleE += 0.01;
    earth.center = [self computePositionOfEarth:angleE];
    //NSLog(@"aaa");
}

- (void) spinMoon {
    angleM += 0.02;
    moon.center = [self computePositionOfMoon:angleM];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer1 invalidate];
    timer1 = nil;
    [timer2 invalidate];
    timer2 = nil;
    
    
}
@end
