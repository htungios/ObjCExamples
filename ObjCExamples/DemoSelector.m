//
//  DemoSelector.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 22/10/2015.
//  Copyright (c) Năm 2015 HoangNgocTung. All rights reserved.
//

#import "DemoSelector.h"

@interface DemoSelector ()
@property (weak, nonatomic) IBOutlet UISlider *slider;


@end

@implementation DemoSelector

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(hideSlider) withObject:nil afterDelay:3];
    
}
- (IBAction)onCrunchdata:(id)sender {
    //[self performSelectorInBackground:@selector(doCrunchData) withObject:nil];
    //[self performSelectorOnMainThread:@selector(doCrunchData) withObject:nil waitUntilDone:false];
    [self performSelectorOnMainThread:@selector(processData:) withObject:@{@"Apple" : @"Tao" , @"Lemon" : @"Chanh"} waitUntilDone:true];
}
-(void) processData: (NSDictionary*) data {
    for (NSString* key in [data allKeys]) {
        NSLog(@"%@ - %@", key, [data valueForKey:key] );
    }
    
}
-(void) doCrunchData {
    [NSThread sleepForTimeInterval:2];
}
-(void) hideSlider {
    self.slider.hidden = true;
}

@end
