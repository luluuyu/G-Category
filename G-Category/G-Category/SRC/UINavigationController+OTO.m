//
//  UINavigationController+OTO.m
//  OTOTeacher
//
//  Created by CS on 15/8/31.
//  Copyright (c) 2015年 ChineseSkill. All rights reserved.
//

#import "UINavigationController+OTO.h"
#import "UIImage+UIImage_G.h"

@implementation UINavigationController (UINavigationController_OTO)

- (void)setupForDefaultNavigationController
{
    NSLog(@"");
}

- (void)setupForDefaultModalNavigationcontrollerWithBackTarget:(id)target action:(SEL)action controller:(UIViewController *)controller
{
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_page_close_black"] changeImageColor:[UIColor blackColor]] style:UIBarButtonItemStyleDone target:target action:action];
    self.navigationBar.tintColor = [UIColor blackColor];
    controller.navigationItem.leftBarButtonItem = leftBarButton;
}

@end
