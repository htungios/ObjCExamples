//
//  ScaleAndSlider.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 11/19/15.
//  Copyright © 2015 HoangNgocTung. All rights reserved.
//

#import "ScaleAndSlider.h"

@interface ScaleAndSlider () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView; 
@end

@implementation ScaleAndSlider
{
    UIImageView* photo;
    UISlider* slider;
    UIToolbar* toolBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    toolBar = [UIToolbar new];
    [toolBar sizeToFit];
    
    slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 8, self.view.bounds.size.width - 16, 40)];
    slider.minimumValue = 0.2;
    slider.maximumValue = 5.0;
    slider.value = 0.2;
    [slider addTarget:self
               action:@selector(onValueChangle:)
     forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithCustomView:slider];
    toolBar.items = @[barButton];
//    NSLog(@"1 %f", toolBar.bounds.size.height);
//    NSLog(@"2 %f", self.view.bounds.size.height);
//
//    toolBar.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height - 2*toolBar.bounds.size.height);
//    
    toolBar.frame = CGRectMake(0, 0, toolBar.bounds.size.width, toolBar.bounds.size.height);
    
    [self.view addSubview:toolBar];
 
    CGRect scrollRect = CGRectMake(0, toolBar.bounds.size.height , self.view.bounds.size.width, self.view.bounds.size.height - 2 * toolBar.bounds.size.height);
    self.scrollView = [[UIScrollView alloc] initWithFrame:scrollRect];
    photo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"millennium_puzzle"]];
    [self.scrollView addSubview:photo];
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = slider.minimumValue;
    self.scrollView.maximumZoomScale = slider.maximumValue;
    self.scrollView.zoomScale = slider.value;
    [self.view addSubview:self.scrollView];
    
    
    
    
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return photo;
}

- (void) onValueChangle: (UISlider *) sender {
    [self.scrollView setZoomScale:sender.value
                         animated:true];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    slider.value = self.scrollView.zoomScale;
}
@end
