//
//  UINavigationController+OTO.h
//  OTOTeacher
//
//  Created by CS on 15/8/31.
//  Copyright (c) 2015年 ChineseSkill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (UINavigationController_OTO)

- (void)setupForDefaultNavigationController;

- (void)setupForDefaultModalNavigationcontrollerWithBackTarget:(id)target action:(SEL)action controller:(UIViewController *)controller;


@end


