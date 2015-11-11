//
//  DemoColor2.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 11/11/2558 BE.
//  Copyright (c) 2558 HoangNgocTung. All rights reserved.
//

#import "DemoColor2.h"
#import "UIColor+HexColor.h"
#import "Color.h"

@interface DemoColor2 ()

@end

@implementation DemoColor2
{
    Color *view1, *view2, *view3, *view4, *view5;
    NSArray *cpArray;
    int colorPatternIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSArray* cp1 = @[@"69D2E7",@"A7DBD8",@"E0E4CC",@"F38630",@"FA6900"];
    NSArray* cp2 = @[@"00A0B0",@"6A4A3C",@"CC333F",@"EB6841",@"EDC951"];
    NSArray* cp3 = @[@"774F38",@"E08E79",@"F1D4AF",@"ECE5CE",@"C5E0DC"];
    NSArray* cp4 = @[@"FF9900",@"424242",@"E9E9E9",@"BCBCBC",@"3299BB"];
    NSArray* cp5 = @[@"D1E751",@"FFFFFF",@"000000",@"4DBCE9",@"26ADE4"];
    NSArray* cp6 = @[@"351330",@"424254",@"64908A",@"E8CAA4",@"CC2A41"];
    cpArray = @[cp1,cp2,cp3,cp4,cp5,cp6];
    
    CGFloat colorWidth = 200;
    CGFloat colorHeight = 40;
    CGFloat x0 = (self.view.bounds.size.width - colorWidth) * 0.5 ;
    
    view1 = [[Color alloc] initWithHex:@"655643"
                                 alpha:1.0
                                 frame:CGRectMake(x0, 10, colorWidth, colorHeight)];
    view2 = [[Color alloc] initWithHex:@"80BCA3"
                                 alpha:1.0
                                 frame:CGRectMake(x0, 60, colorWidth, colorHeight)];
    view3 = [[Color alloc] initWithHex:@"F6F7BD"
                                 alpha:1.0
                                 frame:CGRectMake(x0, 110, colorWidth, colorHeight)];
    view4 = [[Color alloc] initWithHex:@"E6AC27"
                                 alpha:1.0
                                 frame:CGRectMake(x0, 160, colorWidth, colorHeight)];
    view5 = [[Color alloc] initWithHex:@"BF4D28"
                                 alpha:1.0
                                 frame:CGRectMake(x0, 210, colorWidth, colorHeight)];
    
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [self.view addSubview:view4];
    [self.view addSubview:view5];
    
    colorPatternIndex = 0;
    [self performSelector:@selector(animateColor:)
               withObject:[[NSNumber alloc] initWithInt:colorPatternIndex]
               afterDelay:1];
    
}

- (void) animateColor : (NSNumber*) cpIndex {
    int index = [cpIndex intValue];
    [UIView animateWithDuration:3 animations:^{
        NSArray* cp = cpArray[index];
        view1.hex = cp[0];
        view2.hex = cp[1];
        view3.hex = cp[2];
        view4.hex = cp[3];
        view5.hex = cp[4];
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1
                         animations:^{
                             [view1 fadeOut];
                             [view2 fadeOut];
                             [view3 fadeOut];
                             [view4 fadeOut];
                             [view5 fadeOut];
                             
                         } completion:^(BOOL finished) {
                             self->colorPatternIndex ++;
                             if (self->colorPatternIndex == cpArray.count) {
                                 self->colorPatternIndex = 0;
                             }
                             [self animateColor:[[NSNumber alloc] initWithInt:colorPatternIndex]];
                         }];
        
    }];
}

@end
