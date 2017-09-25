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

+ (NSString *)NG_StringValue:(int)value;

+(NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary;

+(NSString *)jsonStringWithArray:(NSArray *)array;

+(NSString *)jsonStringWithString:(NSString *)string;

+(NSString *)jsonStringWithObject:(id)object;

- (NSDictionary *)dictionaryType;

+ (NSString *)deviceUIDString;

+ (NSString *)md5:(NSString *)str;

@end

@interface NSString (MySortAdditions)
- (NSComparisonResult)CompareMyStringASC:(NSString*)aString;
- (NSComparisonResult)CompareMyStringDESC:(NSString*)aString;
- (NSComparisonResult)CompareMyStringToIntASC:(NSString*)aString;
- (NSComparisonResult)CompareMyStringToIntDESC:(NSString*)aString;
@end


