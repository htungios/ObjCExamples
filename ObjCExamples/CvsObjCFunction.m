//
//  CvsObjCFunction.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 22/10/2015.
//  Copyright (c) Năm 2015 HoangNgocTung. All rights reserved.
//

#import "CvsObjCFunction.h"
#import "util.h"
#import "UntilObject.h"
@interface CvsObjCFunction ()

@end

@implementation CvsObjCFunction

- (void)viewDidLoad {
    [super viewDidLoad];
    int result = add(10, 20);
    NSLog(@"%d",result);

    UntilObject* util = [UntilObject new];
    result = [util addA:10 andB:20];
    
    
    NSLog(@"%ld",factorial(5));
    NSLog(@"%ld",[util factorial:5]);
  
    
}
- (int) addA: (int) a andB: (int) b {
    return a + b ;
}
- (long) factorial: (long) a {
    if (a<2) {
        return 1;
    } else {
        return [self factorial:a-1] * a;
    }
}
@end
