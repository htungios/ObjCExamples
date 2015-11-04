//
//  SwiftToObjC.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 03/11/2015.
//  Copyright (c) Năm 2015 HoangNgocTung. All rights reserved.
//

#import "SwiftToObjC.h"

@interface SwiftToObjC ()
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UISlider *rotate;
@property (weak, nonatomic) IBOutlet UISlider *scale;

@end

@implementation SwiftToObjC


- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)onShow:(UISwitch *)sender {
    _myView.hidden = !sender.on;
}
-(void) rotateAndScale {
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(self.rotate.value * -M_PI_2);
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(self.scale.value,self.scale.value);
    _myView.transform = CGAffineTransformConcat(rotateTransform, scaleTransform);
    
    
}
- (IBAction)onAlphaChangle:(UISlider *)sender {
    _myView.alpha = sender.value;
}

- (IBAction)onRotate:(UISlider *)sender {
    [self rotateAndScale];
}

- (IBAction)onScale:(UISlider *)sender {
    [self rotateAndScale];
}

- (IBAction)onColorChangle:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            _myView.backgroundColor = [UIColor blackColor];
            break;
        case 1:
            _myView.backgroundColor = [UIColor redColor];
            break;
        case 2:
            _myView.backgroundColor = [UIColor greenColor];
            break;
        case 3:
            _myView.backgroundColor = [UIColor blueColor];
            break;
            
        default:
            break;
    }
}

@end
