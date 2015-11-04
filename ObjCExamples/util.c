//
//  util.c
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 22/10/2015.
//  Copyright (c) Năm 2015 HoangNgocTung. All rights reserved.
//

#include "util.h"
int add(int a, int b) {
    return a + b ;
}
long factorial(long a) {
    if (a < 2) {
        return 1;
    } else {
        return factorial(a-1) * a ;
    }
}