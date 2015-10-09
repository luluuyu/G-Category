//
//  NSString+G.h
//  ChineseSkillNew
//
//  Created by cslop on 14/12/30.
//  Copyright (c)2014年 ChineseSkill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (G)

- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;

+ (NSString *)URLEncodedString:(NSString *)string;
+ (NSString *)URLDecodedString:(NSString *)string;

- (CGSize)sizeOfStringWithStringFontSize:(CGFloat)fontSize boundingRectWithWidth:(CGFloat)width height:(CGFloat)height
;

/**
 *  size of string
 *
 *  @param string   string
 *  @param fontSize font size
 *  @param width    max width
 *  @param height   max height
 *
 *  @return CGSize
 */
+ (CGSize)sizeOfStringWithString:(NSString *)string FontSize:(CGFloat)fontSize boundingRectWithWidth:(CGFloat)width height:(CGFloat)height;

- (BOOL)containsWithString:(NSString *)aString;


/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
/**
 *  计算给定文字的 size
 */
- (CGSize)sizeOfString:(NSString *)string;

/**
 *  计算给定label的高度
 *
 *  @param width  label的宽度
 *  @param string label的文字
 *
 *  @return label的最小高度
 */
- (CGFloat)heightOfLabelWithLabelWidth:(CGFloat)width labelFontSize:(CGFloat)size maxHeight:(CGFloat)maxheight;

- (CGFloat)widthOfLabelWithLabelHeight:(CGFloat)height labelFontSize:(CGFloat)size labelString:(NSString *)string maxWidth:(CGFloat)maxWidth;

- (CGFloat)heightOfLabelWithLabel:(UILabel *)label LabelWidth:(CGFloat)width maxHeight:(CGFloat)maxheight;
+ (CGFloat)heightOfLabelWithLabel:(UILabel *)label Text:(NSString *)text maxHeight:(CGFloat)maxheight;

+ (NSString *)NG_StringValue:(int)value;

+(NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary;

+(NSString *)jsonStringWithArray:(NSArray *)array;

+(NSString *)jsonStringWithString:(NSString *)string;

+(NSString *)jsonStringWithObject:(id)object;

- (NSDictionary *)dictionaryType;

+ (NSString *)deviceUIDString;

+ (NSString *)md5:(NSString *)str;

@end
