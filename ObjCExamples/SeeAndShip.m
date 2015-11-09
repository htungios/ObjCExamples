//
//  SeeAndShip.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 11/9/2558 BE.
//  Copyright (c) 2558 HoangNgocTung. All rights reserved.
//

#import "SeeAndShip.h"
#import <AVFoundation/AVFoundation.h>

@interface SeeAndShip ()
{
    UIImageView *ship;
    UIImageView *see1, *see2;
    AVAudioPlayer *audioPlayer;
}

@end

@implementation SeeAndShip

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self drawShipAndSee];
    [self animatedShip];
    [self animatedSee];
    [self playSong];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
}

- (void) drawShipAndSee {
    
    see1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ocean1.png"]];
    see1.frame = self.view.bounds;
    [self.view addSubview:see1];
    
    see2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ocean2.png"]];
    see2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:see2];
    
    ship = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ship.png"]];
    ship.center = CGPointMake(self.view.bounds.size.width / 2 , self.view.bounds.size.height * 0.55);
    [self.view addSubview:ship];
    
}
- (void) animatedShip {
    [UIView animateWithDuration:1 animations:^{
        ship.transform = CGAffineTransformMakeRotation(-0.07);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            ship.transform = CGAffineTransformMakeRotation(0.07);
        } completion:^(BOOL finished) {
            [self animatedShip];
        }];
    }];
}
- (void) animatedSee {
    [UIView animateWithDuration:10 animations:^{
        see1.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        see2.frame = self.view.bounds;
    } completion:^(BOOL finished) {
        see1.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        [UIView animateWithDuration:10 animations:^{
            see2.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
            see1.frame =self.view.bounds;
        } completion:^(BOOL finished) {
            see2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
            [self animatedSee];
        }];
    }];
}

- (void) playSong {
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"Kiss The Rain" ofType:@"mp3"]; // lay ra dia chi file gom Ten va Dinh dang
    NSURL *url = [NSURL fileURLWithPath:filepath];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
    
}
- (void) viewWillDisappear:(BOOL)animated {
    [audioPlayer stop];
}

@end
