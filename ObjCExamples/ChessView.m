//
//  ChessView.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 03/11/2015.
//  Copyright (c) Năm 2015 HoangNgocTung. All rights reserved.
//

#import "ChessView.h"

@interface ChessView ()

@end

@implementation ChessView
{
    CGFloat margin;
    CGFloat h0;
    UIView *containerView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    margin = 20.0;
    h0 = 160.0;
    
    
    containerView = [[UIView alloc] init];
    containerView.frame = CGRectMake(0, 0, self.view.bounds.size.width - margin * 2.0, self.view.bounds.size.width - margin * 2.0);
    containerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:containerView];
    
    containerView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    NSLog(@"w %f and h %f",containerView.bounds.size.width,containerView.bounds.size.height);
    
    float cellWidth = (containerView.bounds.size.width) / 8 ;
    
    for (int rowIndex = 0; rowIndex <= 7; rowIndex++) {
        for (int colIndex = 0; colIndex <= 7; colIndex++) {
            CGRect  rect;
            rect = CGRectMake((CGFloat)rowIndex * cellWidth ,(CGFloat)colIndex * cellWidth, cellWidth, cellWidth);
            UIView *cell = [[UIView alloc] initWithFrame:rect];
            if (rowIndex % 2 ==0) {
                if (colIndex % 2 == 0) {
                    cell.backgroundColor = [UIColor blackColor];
                    NSLog(@"%d - %d",rowIndex,colIndex);
                }   else {
                    cell.backgroundColor = [UIColor whiteColor];
                }
            } else {
                if (colIndex % 2 == 0) {
                    cell.backgroundColor = [UIColor whiteColor];
                } else {
                    cell.backgroundColor = [UIColor blackColor];
                    NSLog(@"%d - %d",rowIndex,colIndex);
                }
            }
            [containerView addSubview:cell];
        }
    }
    UISlider *slider;
    slider = [[UISlider alloc] initWithFrame:CGRectMake(20, self.view.bounds.size.height * 4 / 5 , self.view.bounds.size.width - 40, 10)];
    slider.minimumValue = -1;
    slider.maximumValue = 1;
    slider.value = 0;
    [slider addTarget:self action:@selector(onRotage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}
-(void) onRotage : (UISlider*) sender {
    containerView.transform = CGAffineTransformMakeRotation((CGFloat)sender.value * (CGFloat)M_PI );
}


@end
