//
//  Stars.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 11/9/2558 BE.
//  Copyright (c) 2558 HoangNgocTung. All rights reserved.
//

#import "Stars.h"

@interface Stars ()
{
    UIImageView *red, *green, *violet, *brown;
    CGFloat deltaX, deltaY;
    CGPoint center;
}

@end

@implementation Stars

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    deltaX = 100;
    deltaY = 100;
    center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height *0.5);
    red = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red.png"]];
    green = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green.png"]];
    violet = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"violet.png"]];
    brown = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brown.png"]];
    
    red.center = center;
    green.center = center;
    violet.center = center;
    brown.center = center;
    
    [self.view addSubview:red];
    [self.view addSubview:green];
    [self.view addSubview:violet];
    [self.view addSubview:brown];
    
    [self starsMove];
}

- (void) starsMove {
    [UIImageView animateWithDuration:1 animations:^{
        red.center = CGPointMake(center.x + deltaX, center.y + deltaY);
        green.center = CGPointMake(center.x + deltaX, center.y - deltaY);
        violet.center = CGPointMake(center.x - deltaX, center.y - deltaY);
        brown.center = CGPointMake(center.x - deltaX, center.y + deltaY);
    } completion:^(BOOL finished) {
        [UIImageView animateWithDuration:1 animations:^{
            red.center = CGPointMake(center.x, center.y + deltaY);
            green.center = CGPointMake(center.x + deltaX, center.y);
            violet.center = CGPointMake(center.x, center.y - deltaY);
            brown.center = CGPointMake(center.x - deltaX, center.y);
        } completion:^(BOOL finished) {
            [UIImageView animateWithDuration:1 animations:^{
                red.center = center;
                green.center = center;
                violet.center = center;
                brown.center = center;
            } completion:^(BOOL finished) {
                [self starsMove];
            }];
            
        }];
    
    }];
}


@end
