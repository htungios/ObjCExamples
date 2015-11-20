//
//  ContentSizeBasic.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 11/20/15.
//  Copyright © 2015 HoangNgocTung. All rights reserved.
//

#import "ContentSizeBasic.h"

@interface ContentSizeBasic () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;
@end

@implementation ContentSizeBasic
{
    UIImageView* photo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    photo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Yugioh.jpg"]];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(8, 8, self.view.bounds.size.width - 16, 500)];
    self.scrollView.backgroundColor = [UIColor grayColor];
    self.scrollView.contentSize = CGSizeMake(photo.bounds.size.width, photo.bounds.size.height);
    self.scrollView.bounces = true; // true , keo photo ra xa hon scrollView , flase nguoc lai.
    self.scrollView.showsHorizontalScrollIndicator = true; // keo ngang
    self.scrollView.showsVerticalScrollIndicator = true; // keo doc
    [self.scrollView addSubview:photo];
    [self.view addSubview:self.scrollView];
}



@end
