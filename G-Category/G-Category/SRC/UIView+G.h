//
//  UIView+G.h
//  ChineseSkillNew
//
//  Created by cslop on 14/12/23.
//  Copyright (c) 2014年 ChineseSkill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView(G)

+ (CGRect)getCenterFrameWithWidth:(float)Width Height:(float)height SuperView:(UIView *)view;

- (CGRect)getCenterFrameWithWidth:(float)Width Height:(float)height;
/**
 设置视图水平方向居中于父视图
 */
- (void)setHorizontalCentralInSuperView;
/**
 设置视图竖直方向居中于父视图
 */
- (void)setVerticalCentralInSuperView;
///视图大小
- (CGSize)viewSize;
///视图宽度
- (CGFloat)viewWidth;
///视图高度
- (CGFloat)viewHeight;
/// 视图x坐标
- (CGFloat)viewOriginX;
/// 视图y坐标
- (CGFloat)viewOriginY;

- (void)setFrameWidth:(CGFloat)width animated:(BOOL)animated animateDuration:(CGFloat)duration;
- (void)setFrameHeight:(CGFloat)height animated:(BOOL)animated animateDuration:(CGFloat)duration;
- (void)setFrameOriginX:(CGFloat)xP;
- (void)setFrameOriginY:(CGFloat)yP;


/**
 设置包含的子视图在父视图中水平方向居中
 @param space 子视图之间的距离
 @param subviews 要居中的子视图
 */
- (void)setSubviewHorizontalCentralInSuperViewWithSubviews:(id)view space:(CGFloat)space;
/**
 设置包含的子视图在父视图中竖直方向居中
 @param space 子视图竖直方向的间距
 @param subviews 要设置的子视图
 */
- (void)setSubviewVerticalCentralInSuperViewWithSubviews:(id)view space:(CGFloat)space;
- (void)setSpaceInSuperViewWithSubview:(id)view VerticalCentralSpace:(CGFloat)Space andHorizontalSpace:(CGFloat)space;
- (void)setSpaceInSuperViewWithSubview:(id)view VerticalCentralSpace:(CGFloat)Space andHorizontalSpace:(CGFloat)space Width:(CGFloat)width Height:(CGFloat)height;

- (void)autoLayout_setCenterInSuperViewWithWidth:(float)width height:(float)height;

@end
