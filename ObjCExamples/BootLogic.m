//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"Function", CLASS: @"DemoFunction"},
                                    @{TITLE: @"Selector", CLASS: @"DemoSelector"},
                                    @{TITLE: @"C function And ObjC function", CLASS: @"CvsObjCFunction"},
                                    
                          ]};
    NSDictionary* intermediate = @{SECTION: @"Intermediate", MENU: @[
                                    @{TITLE: @"Array", CLASS: @"InterB"},
                                    @{TITLE: @"Dictionary", CLASS: @"InterB"}                                  ]};
    NSDictionary* advanced = @{SECTION: @"Advanced", MENU: @[
                                    @{TITLE: @"Advanced C", CLASS: @"AdvancedC"}
                             ]};
    NSDictionary* fromSwiftToObjC = @{SECTION: @"Changle", MENU: @[
                                       @{TITLE: @"SwiftToObjC", CLASS: @"SwiftToObjC"},
                                       @{TITLE: @"ChessView", CLASS: @"ChessView"}
                            ]};
    NSDictionary* basicUiview = @{SECTION: @"UIView", MENU: @[
                                @{TITLE: @"CampFire", CLASS: @"DemoUIImageView"},
                                @{TITLE: @"NestedSquares", CLASS: @"nestedSquares"},
                                @{TITLE: @"FlyUpAndDown", CLASS: @"flyUpAndDown"},
                                @{TITLE: @"Thuyền và Biển", CLASS: @"SeeAndShip"},
                                @{TITLE: @"Stars", CLASS: @"Stars"}
                            ]};
    NSDictionary* hexcolor = @{SECTION: @"DemoColor", MENU: @[
                                           @{TITLE: @"DemoColor", CLASS: @"DemoColor"},
                                           @{TITLE: @"DemoColor2", CLASS: @"DemoColor2"}
                                           ]};

    

    
    mainScreen.menu = @[basic, intermediate, advanced, fromSwiftToObjC, basicUiview, hexcolor];
    mainScreen.title = @"Objective -C by Examples";
    mainScreen.about = @"Hoang Ngoc Tung - DH Mo Dia Chat";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
