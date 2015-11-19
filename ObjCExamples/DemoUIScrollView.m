//
//  DemoUIScrollView.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 11/19/15.
//  Copyright © 2015 HoangNgocTung. All rights reserved.
//

#import "DemoUIScrollView.h"

@interface DemoUIScrollView () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;
@end

@implementation DemoUIScrollView
{
    UIImageView* photo;
}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    photo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"millennium_puzzle"]];
    [self.scrollView addSubview:photo];
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 0.2;
    self.scrollView.maximumZoomScale = 4.0;
    [self.view addSubview:self.scrollView];
    
    }

- (UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return photo;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
    float i = self.scrollView.zoomScale;
    NSString* string = [NSString stringWithFormat:@"%2.2f",i];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
    label.text = string;
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:label];
    

}
@end
