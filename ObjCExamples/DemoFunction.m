//
//  DemoFunction.m
//  ObjCExamples
//
//  Created by Hoang Ngoc Tung on 22/10/2015.
//  Copyright (c) Năm 2015 HoangNgocTung. All rights reserved.
//

#import "DemoFunction.h"

@interface DemoFunction ()

@end

@implementation DemoFunction

- (void)viewDidLoad {
    [super viewDidLoad];
    [self writeln:@"Demo Function"];
    [self writeln:@"Hello World"];
    [self sayFirstName:@"Steve" andLastName:@"Jobs"];
    float TempDegree = 30.1;
    NSString* result = [NSString stringWithFormat:@"%2.1f degree elqual to %3.1f fahrenheit", TempDegree ,[self CelciusToFahrenheit:TempDegree]];
    [self writeln:result];
    // %2.1f -- tempdegree
    // %3.1f -- [self celciustofahrenheit:tempdegree]
    [self performSelector:@selector(CelciusToFahrenheit)];
    [self performSelector:@selector(CelciusToFahrenheit2:) withObject:@(30.1)];
    //[self performSelector:@selector(CelciusToFahrenheit2: and: CelciusToFarenheit:)];
    
    
}
- (void) sayFirstName: (NSString*) firstName andLastName: (NSString*) lastName {
    NSLog(@"%@ %@", firstName, lastName);
    
}
// (kieu tra ve) ten ham: (kieu bien) ten bien
-(float) CelciusToFahrenheit: (float) degree {
    return degree *1.8 +32.0;
}
-(void) CelciusToFahrenheit {
    NSLog(@"Do Nothing");
}
-(float) CelciusToFahrenheit2: (NSNumber*) degree {
    float result = [degree floatValue] * 1.8 + 32.0;
    NSLog(@"result = %2.1f", result);
    return result;
}

@end
