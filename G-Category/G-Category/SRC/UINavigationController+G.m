//
//  UINavigationController+OTO.m
//  OTOTeacher
//
//  Created by CS on 15/8/31.
//  Copyright (c) 2015年 ChineseSkill. All rights reserved.
//

#import "UINavigationController+G.h"
#import "UIImage+UIImage_G.h"

@implementation UINavigationController (UINavigationController_G)

- (void)setupForDefaultNavigationController
{
    NSLog(@"");
}

- (void)setupForDefaultModalNavigationcontrollerWithImage:(UIImage *)image BackTarget:(id)target action:(SEL)action controller:(UIViewController *)controller
{
    if (image == nil)
    {
        image = [[UIImage imageNamed:@"nav_page_close_black"] changeImageColor:[UIColor blackColor]];
    }
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_page_close_black"] style:UIBarButtonItemStyleDone target:target action:action];
    self.navigationBar.tintColor = [UIColor blackColor];
    controller.navigationItem.leftBarButtonItem = leftBarButton;
}

- (void)setupForDefaultPushNavigationcontrollerWithImage:(UIImage *)image BackTarget:(id)target action:(SEL)action controller:(UIViewController *)controller
{
    if (image == nil)
    {
        image = [UIImage imageNamed:@"nav_page_back_black"];
    }
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:target action:action];
    self.navigationBar.tintColor = [UIColor blackColor];
    controller.navigationItem.leftBarButtonItem = leftBarButton;
}

@end
