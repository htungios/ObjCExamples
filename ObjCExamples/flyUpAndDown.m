//
//  flyUpAndDown.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 06/11/2015.
//  Copyright (c) Năm 2015 HoangNgocTung. All rights reserved.
//

#import "flyUpAndDown.h"

@interface flyUpAndDown ()
{
    UIImageView *bird;
}

@end

@implementation flyUpAndDown

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self drawJungle];
    [self drawBird];
    [self flyUpAndDown];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.edgesForExtendedLayout = UIRectEdgeNone; // tra ve kich thuoc man hinh ko tinh thanh status va thanh navigationBar
   
}

- (void) drawJungle {
    UIImageView* jungle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    jungle.frame =self.view.bounds;
    jungle.contentMode = UIViewContentModeScaleAspectFill; // contentmode : dieu chinh noi dung, kich thuoc. contentmodeScaleAspectFill : lap day man hinh
    [self.view addSubview:jungle];
}
- (void) drawBird {
    bird = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 68)];
    bird.animationImages = @[[UIImage imageNamed:@"bird0"],
                            [UIImage imageNamed:@"bird1"],
                            [UIImage imageNamed:@"bird2"],
                            [UIImage imageNamed:@"bird3"],
                            [UIImage imageNamed:@"bird4"],
                            [UIImage imageNamed:@"bird5"]
                             ];
    bird.animationRepeatCount = -1;
    bird.animationDuration = 1;
    [self.view addSubview:bird];
    [bird startAnimating];
    
}
- (void) flyUpAndDown {
    bird.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:5 animations:^{
        bird.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        bird.transform= CGAffineTransformConcat(CGAffineTransformMakeScale(-1, 1), CGAffineTransformMakeRotation(M_PI_4)); // quay nguoc dau con chim
        [UIView animateWithDuration:5 animations:^{
            bird.center = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            [self flyUpAndDown];
        }];
    }];
                                        
}
@end
