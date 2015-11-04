//
//  UntilObject.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 22/10/2015.
//  Copyright (c) Năm 2015 HoangNgocTung. All rights reserved.
//

#import "UntilObject.h"

@implementation UntilObject
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
