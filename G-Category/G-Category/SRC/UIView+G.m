//
//  UIView+G.m
//  ChineseSkillNew
//
//  Created by cslop on 14/12/23.
//  Copyright (c) 2014年 ChineseSkill. All rights reserved.
//

#import "UIView+G.h"

@implementation UIView(G)

+ (CGRect)getCenterFrameWithWidth:(float)Width Height:(float)height SuperView:(UIView *)view
{
    float x = (view.frame.size.width - Width) * 0.5;
    float y = (view.frame.size.height - height) * 0.5;
    
    return CGRectMake(x, y, Width, height);
}

- (CGRect)getCenterFrameWithWidth:(float)Width Height:(float)height
{
    float x = (self.frame.size.width - Width) * 0.5;
    float y = (self.frame.size.height - height) * 0.5;
    
    return CGRectMake(x, y, Width, height);
}

- (void)setFrameOriginX:(CGFloat)xP
{
    CGRect frame = self.frame;
    frame.origin.x = xP;
    self.frame = frame;
}
- (void)setFrameOriginY:(CGFloat)yP
{
    CGRect frame = self.frame;
    frame.origin.y = yP;
    self.frame = frame;
}

- (void)setFrameWidth:(CGFloat)width animated:(BOOL)animated animateDuration:(CGFloat)duration
{
    CGRect frame = self.frame;
    frame.size.width = width;
    if (animated) {
        [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.9f initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.frame = frame;
        } completion:^(BOOL finished) {
            if (finished) {
                // add other operation when animate finished..
            }
        }];
    }else{
        self.frame = frame;
    }
}

- (void)setFrameHeight:(CGFloat)height animated:(BOOL)animated animateDuration:(CGFloat)duration
{
    CGRect frame = self.frame;
    frame.size.height = height;
    if (animated) {
        [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.9f initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.frame = frame;
        } completion:^(BOOL finished) {
            if (finished) {
                // add other operation when animate finished..
            }
        }];
    }else{
        self.frame = frame;
    }
}

- (void)setHorizontalCentralInSuperView
{
    if (self.superview) {
        CGPoint preCenter = self.center;
        preCenter.x = self.superview.bounds.size.width/2.f;
        self.center = preCenter;
    }
}

- (void)setVerticalCentralInSuperView
{
    if (self.superview) {
        CGPoint preCenter = self.center;
        preCenter.y = self.superview.bounds.size.height/2.f;
        self.center = preCenter;
    }
}

///视图大小
- (CGSize)viewSize
{
    return self.frame.size;
}
///视图宽度
- (CGFloat)viewWidth
{
    return self.frame.size.width;
}
///视图高度
- (CGFloat)viewHeight
{
    return self.frame.size.height;
}

/// 视图x坐标
- (CGFloat)viewOriginX
{
    return self.frame.origin.x;
}

/// 视图y坐标
- (CGFloat)viewOriginY
{
    return self.frame.origin.y;
}

- (void)setSubviewHorizontalCentralInSuperViewWithSubviews:(id)view space:(CGFloat)space
{
    if ([view isKindOfClass:[UIView class]])
    {
        UIView *subview = (UIView *)view;
        subview.frame = CGRectMake(self.frame.size.width * space - subview.frame.size.width * space, subview.frame.origin.y, subview.frame.size.width, subview.frame.size.height);
    }
    else if ([view isKindOfClass:[CALayer class]])
    {
        CALayer *layer = (CALayer *)view;
        layer.frame = CGRectMake(self.frame.size.width * space - layer.frame.size.width * space, layer.frame.origin.y, layer.frame.size.width, layer.frame.size.height);
    }
}

- (void)setSubviewVerticalCentralInSuperViewWithSubviews:(id)view space:(CGFloat)space
{
    if ([view isKindOfClass:[UIView class]])
    {
        UIView *subview = (UIView *)view;
        subview.frame = CGRectMake(subview.frame.origin.x, self.frame.size.height * space - subview.frame.size.height * space, subview.frame.size.width, subview.frame.size.height);
    }
    else if ([view isKindOfClass:[CALayer class]])
    {
        CALayer *layer = (CALayer *)view;
        layer.frame = CGRectMake(layer.frame.origin.x, self.frame.size.height * space - layer.frame.size.height * space, layer.frame.size.width, layer.frame.size.height);
    }
}

- (void)setSpaceInSuperViewWithSubview:(id)view VerticalCentralSpace:(CGFloat)VSpace andHorizontalSpace:(CGFloat)HSpace
{
    if ([view isKindOfClass:[UIView class]])
    {
        UIView *subview = (UIView *)view;
        subview.frame = CGRectMake(self.frame.size.width * HSpace - subview.frame.size.width * HSpace,
                                   self.frame.size.height * VSpace - subview.frame.size.height * VSpace,
                                   subview.frame.size.width,
                                   subview.frame.size.height);
    }
    else if ([view isKindOfClass:[CALayer class]])
    {
        CALayer *layer = (CALayer *)view;
        layer.frame = CGRectMake(self.frame.size.width * HSpace - layer.frame.size.width * HSpace,
                                   self.frame.size.height * VSpace - layer.frame.size.height * VSpace,
                                   layer.frame.size.width,
                                   layer.frame.size.height);
    }
}
- (void)setSpaceInSuperViewWithSubview:(id)view VerticalCentralSpace:(CGFloat)VSpace andHorizontalSpace:(CGFloat)HSpace Width:(CGFloat)width Height:(CGFloat)height
{
    if ([view isKindOfClass:[UIView class]])
    {
        UIView *subview = (UIView *)view;
        subview.frame = CGRectMake(self.frame.size.width * HSpace - width * HSpace,
                                   self.frame.size.height * VSpace - height * VSpace,
                                   width,
                                   height);
    }
    else if ([view isKindOfClass:[CALayer class]])
    {
        CALayer *layer = (CALayer *)view;
        layer.frame = CGRectMake(self.frame.size.width * HSpace - width * HSpace,
                                   self.frame.size.height * VSpace - height * VSpace,
                                   width,
                                   height);
    }
}

- (void)autoLayout_setCenterInSuperViewWithWidth:(float)width height:(float)height
{
    NSLayoutConstraint *width_constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:width];
    NSLayoutConstraint *height_constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:height];
    [self addConstraints:@[width_constraint,height_constraint]];
    
    NSLayoutConstraint *top_constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual  toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *bottom_constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual  toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    [self.superview addConstraints:@[top_constraint,bottom_constraint]];
}

@end
