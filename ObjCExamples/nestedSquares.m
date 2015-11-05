//
//  nestedSquares.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 05/11/2015.
//  Copyright (c) Năm 2015 HoangNgocTung. All rights reserved.
//

#import "nestedSquares.h"

@interface nestedSquares ()

@end

@implementation nestedSquares

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self performSelector:@selector(rotateAllSquares)
               withObject:nil
               afterDelay:2];
    [self drawNestedSquares];
    [self rotateAllSquares];
    
}

- (void) drawNestedSquares {
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat margin =20;
    CGFloat recWidth = mainViewSize.width - margin * 2.0;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    CGPoint center = CGPointMake(mainViewSize.width * 0.5, (mainViewSize.height + statusNavigationBarHeight) * 0.5);
    for (int i = 0; i<10; i++) {
        UIView *square;
        if (i % 2 == 0) {
            square = [self drawSquaresByWidth:recWidth
                                        rotate:false
                                       center:center];
        } else {
            square = [self drawSquaresByWidth:recWidth
                                       rotate:true
                                       center:center];
        }
        [self.view addSubview:square];
        recWidth= recWidth * 0.707; // 1/can2 = 0.707
    }
    
    
}

- (UIView*) drawSquaresByWidth : (CGFloat) width
                        rotate : (BOOL) rotate
                        center : (CGPoint) center {
    UIView *squares = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    squares.center = center;
    squares.backgroundColor = rotate ? [UIColor whiteColor] : [UIColor darkGrayColor];
    squares.transform = rotate ? CGAffineTransformMakeRotation(M_PI_4) : CGAffineTransformIdentity;
    return squares;
    
}

- (void) rotateAllSquares {
    [UIView animateWithDuration:2 animations:^{
        for (int i = 0; i < self.view.subviews.count; i++) {
            if (i % 2 == 0) {
                ((UIView*)self.view.subviews[i]).transform =   CGAffineTransformMakeRotation(M_PI_4);
            } else {
                ((UIView*)self.view.subviews[i]).transform = CGAffineTransformIdentity;
            }
        }
    }
     ];
};
    

@end
