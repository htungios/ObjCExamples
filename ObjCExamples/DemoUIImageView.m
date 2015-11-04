//
//  DemoUIImageView.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 04/11/2015.
//  Copyright (c) Năm 2015 HoangNgocTung. All rights reserved.
//

#import "DemoUIImageView.h"

@interface DemoUIImageView ()

@end

@implementation DemoUIImageView
{
    UIImageView *fire;
}
-(void) loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.edgesForExtendedLayout = UIRectEdgeNone; // xac dinh 4 canh cua khung
    [self burnfire];
}
-(void) burnfire {
    fire = [[UIImageView alloc] initWithFrame:self.view.bounds];
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity:15];
    for (int i=1; i<17; i++) {
        NSString* filename;
        if (i< 10) {
            filename = [NSString stringWithFormat:@"campfire0%d.png",i];
        }   else {
            filename = [NSString stringWithFormat:@"campfire%d.png",i];
        }
        [images addObject:[UIImage imageNamed:filename]];
    }
    fire.animationImages = images;
    fire.animationDuration = 2; // thoi gian chuyen giua 2 anh
    fire.animationRepeatCount = 0;
    [self.view addSubview:fire];
    [fire startAnimating];
}

@end
